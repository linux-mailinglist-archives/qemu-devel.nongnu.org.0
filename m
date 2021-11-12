Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDE44EA0C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:29:24 +0100 (CET)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYUV-0000o0-3Z
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlYTK-0008QI-0V; Fri, 12 Nov 2021 10:28:10 -0500
Received: from mail-eopbgr80097.outbound.protection.outlook.com
 ([40.107.8.97]:8765 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlYTE-0001KL-Un; Fri, 12 Nov 2021 10:28:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnOUFx++jcmQpcx6V7fLt0s+kamsh9hsesnQVsJxbrKeSL+Vwl66Fu4GineR7kApY8LcxqOxPtpQfEoxOeniVoCET4sJXjfZBZUpgaRMUjgs5K96iEF4vx/JyhE4SmyYozGBH211Y12J03JUghhy5QIavn7nNQZoK8e1NV5VxN0bgO4PTLmQFiG+qyVXosd1oJJLnToXudl1xUd0pXRill5WNAVmie6hkAFPjcxaKhBHW9mo4YG2i9E1AN/oNcOK69Px0Ub2fm9r5ssdRqRA/DOovud7UzcG7uPenBreSoU4WBxvVGCx5GhTo6wx482hKaQI6N5SvnqjnMpD64xjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4XOp8c8eWcKRoZA+y1BuMkLM4i6rlSEFFuC9qawDrI=;
 b=iFRfeGzIdF/vJY+TILLkXixgeLhTl5Ic+hteTIMaTtG2RIxWvSSBuE5Oj6npzYPmYOh32PW0dWjLLeVh3axkuuhTUmbiRa5QqvK5EwMTpvzhMAkedbFyFrvKHqjeIqb6kRSUvBqBX4Aha3DibV0GiTrUI3w6yNMLOQEFLzyvn+yTRpQaRWt0gf3Q/pLK0NTwNzCOoNSnA3iz03gstF3ugNAeDMnSKmL0Pn7DkKHS2/gip7TcOaOBYkcixDpP/A+LzM1dpg8QvhKDcsVSK6buTcHJdzrialAWRyyAO/nfji4xrKGjLIm6T90CN0tF/mX3GLYViZ/RuOzCjbElQxHdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4XOp8c8eWcKRoZA+y1BuMkLM4i6rlSEFFuC9qawDrI=;
 b=Eaj1gJZ9jJEXHjycaG53lpcrO+xY4s2Prk1vhUtH1yYXzTa4/XPmFApm8FsdB1BfgCXjHgJmJSAmR2P/6rF0N4328PMcANTeybK9tRq/WgTg0OaBmAuIjZLULG+H89B23z3lNe778k0x/f7F8UclRieWmu8q4sxaZxbKxp9bbLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4406.eurprd08.prod.outlook.com (2603:10a6:20b:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Fri, 12 Nov
 2021 15:28:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 15:28:00 +0000
Message-ID: <5e67a25d-2e52-ad84-8407-535cfa21a491@virtuozzo.com>
Date: Fri, 12 Nov 2021 18:27:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 08/10] block: Let replace_child_tran keep indirect
 pointer
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-9-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211111120829.81329-9-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0069.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AM6P191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 15:28:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fff37d46-f982-4eca-5f1e-08d9a5f10314
X-MS-TrafficTypeDiagnostic: AM6PR08MB4406:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4406E19B60AF5FCC49A1B162C1959@AM6PR08MB4406.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hj75Q7jf4FjApy8OJ3LkKfnKzzj2H8bgULAh3fq72sjJ71K/iI7v7Fz6AxP4nQ5eI4VZGd/at5xwoR08BOoyGb58jaNms8wzUBFIhggJBxhCZRGUCtdB4rF+3UNaggRa9rMnHgAC/nlCRtowJcwvMONX1gS1vvzvv+zHEGXgKb7bdJWtfdLWMuDz4edTveZTngprMrdJMCtjySuqUGIm9jdQEouWe0AfpjijvnLcUZbmsTDl+31Yjag5GxrxqxETUWhLMzUFcHCsoQkJpe5P7/Dx3kAf5jDGjwKjPO5u8dDwLTZfZLKuGtSE2SEEgAHy8ItP2eH13Zv4vSOnMdO1JIhaHxYJq9htFR50BRcujaB/TkZskLKHQnClA2VvpACUgDw//il1/XzgneSorhdrWE4HCfWLM1wLQvUcTNhWYnPQrGhg8J+NsuU/Zp2r5V7sUiYvdCFzB4OxiSyrsoOJkzxNnU5NrHTiMJwtSF5Nn1lJGj2pqYHoCm9DMcR44WphVKqg9EFC5nwbcg35D9MziEQicZpP3tnPAcSi/lUPjJq6U38+zUNrXVr31TM3r4+ix+H/GnhS6f5VIUp72iuC4II1wARYQ/7PwGkvwMHSOs2ebrz3HxKqJ3nPVgRfahnhAg5xdluyJdv4R6Gu7RauVYJeeg1PwTcaiIcq+olB42oy+SJS3aqYImGvTV6DsJ5HAp9uLzgk9QnNDqN5kYKrpWjwRh/OCPoSM8HHGGEijahW3hafwZEDEAg8ieu94dYetzCisT1fe5EqOSkfmyC3gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(6486002)(36756003)(2616005)(86362001)(38100700002)(38350700002)(66476007)(66556008)(31696002)(956004)(186003)(26005)(66946007)(52116002)(31686004)(8676002)(8936002)(5660300002)(508600001)(16576012)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJBYXcyTHRMSWhSSzBMYUFjUWUvQ3ZRcE0rbnBDdStmVTZheVpZVTFpaEtj?=
 =?utf-8?B?SUk5TVFNdWFES2REb00rZVNyS2wzUkpJcFFrL2IxYkxQT1Q1YnJncnV1cGZt?=
 =?utf-8?B?TkRnRmxUTGJUMzZVWC9VcDl3aUlkUXRCYVF6bWdLK2dmY0JQTkZNQjI2OG9a?=
 =?utf-8?B?MTY1RE9EOE9RVm5mMUloTFBuRHhWT3d1KzNFT2hVenpxNDZPKzFDallyODg1?=
 =?utf-8?B?eHUybEl3ejBvb0pMNE9TZXdUT0ZOUy9DUm5mQUFsWlBndTY3ZzRjQVduRFdQ?=
 =?utf-8?B?UThzNjFTS2h3SWJFVUFrRFVVaXFYdW9LMnVZREJKbDBmWDY4Zy8yV3NXeTR6?=
 =?utf-8?B?VzI0R0djVTFzZmlXZGQ5Rm9qeXlDNW1zK0hFbjMxcXEvaXFBbXlMNjNlMGxD?=
 =?utf-8?B?OVl2aGRUQThtOVNYK0QzZHEwSnJEVDFyd2NreTBSRUFNVUdTVStPMCtsOGY1?=
 =?utf-8?B?MWMwMkdkYWpTRHU3clppUFFJRERGVnhqdGNnek9PeWpQdFo3WWpjTjhRMFMr?=
 =?utf-8?B?dyt2OExLSlMvTmQwMG5IdFNpbmdxVFM5RldsMUdzTzJHSWthODNtZjVOS0Qw?=
 =?utf-8?B?WS9pSFlHRnY2OUJBVCtKbkp5QTNOaHcrM1NLR3Yray95SjFNYlhtUzRWdmZ2?=
 =?utf-8?B?YTg5TWlQMTg0U3B2bnhsVmluL29IdHVYejJMZFJuZDhBcVBtRElLSHdhK2dT?=
 =?utf-8?B?Q3lZMXhvU0tVd1NVamlUWW5NYmdVUUFNYmZqNUNlRjIxR2Mrd2lwelFidlhl?=
 =?utf-8?B?Y1JoaURrZm02UXF0MWwrTTd0YzUvcXJ4aEpTbzhxVTBwYkpBTnBiamlqeXZM?=
 =?utf-8?B?WGc2UmhXTUx1M0w0VEY5Rit3NTE5dmdOZnpsMnlhOEluUzB6ZUlaY1I1WHFT?=
 =?utf-8?B?NG1OZE1rc0xSOFZrZWdDaUZwUE9xK0hHSmJQK2ZqU2tQUXlsWkR0ZDNKdkhW?=
 =?utf-8?B?d3pmVThuN0p1bHhaUzNHYmo3d1RFa1FNY3JtSlg0OWtYUUJFZllrNDZQdFgv?=
 =?utf-8?B?WFd5a0ZqeE5XRllZQm92ZklUdVE0ZUJjS0pxYTRrSTI4VXpPc1FtaTZLVlpF?=
 =?utf-8?B?T285Zk1SSktLcGxGYkl6QUFFVTdtN29rZU4wL1F3N3BqTktxWlUreHBVRisy?=
 =?utf-8?B?bERrVnB6ZDRRZmtXTlAzZVFUZkxEOFlnK1RjRjZnWVRUTVkwNjdMZHVBZDBO?=
 =?utf-8?B?UUluWlNBWVdtUzRPZUxuYnIrK2hyTHh2UDhGclhWU1pzdUpzWTlsdFNRKzE1?=
 =?utf-8?B?TXJVUE50LzNtY21zQ0JuN1FNOVJKNmY5Ykk1THpPbGpJNUplRlhGL2t4UzQr?=
 =?utf-8?B?YzRaano2NFVCSjF5KzlWMnhIdHdCOEh0MllpSE9qc2M0V05ZWHJwMS8yOXRl?=
 =?utf-8?B?a1p1U3RFY2tMK0xJVm1YeFgwM00ybUdZeVdJV0FmQlRQRXlaeldSYXgrTEN2?=
 =?utf-8?B?bWIzbzFES01GYTNteU9JbWdWWDZmaFB6cEZGMUEvOW9Pc2NHSHFSaHNQcUdW?=
 =?utf-8?B?MDhWTG8rTmd4ZVpLTXZkK3JQSUNSazFYU1pZcWx1SkNPOEIvaWtaMFlCSjEy?=
 =?utf-8?B?V2F4WDU5UnpEZE53QzNVNnBQRjM0Q1JxK0t6R1FSU3BFdGl2bzRRcGlNT2Mv?=
 =?utf-8?B?ZERYM0dGNWVRcTQ4VWJSSXQrbVJyQnJuZXFEa216emRrbnI3WGFVSWZlbGkv?=
 =?utf-8?B?VGlNTVQxb2JrUVZTYTVvVGNUZXFiY2Npd3U4ai9oTGlaZUhPRkJ5TGZoME5N?=
 =?utf-8?B?eExZQ2EvcDYxWWpGRGVGeEJSUjExUjN6eDlCekd0OGJBd0gxejNkQnF4bmZI?=
 =?utf-8?B?ZFBybXpaV3dZaThHYWNKMTR1Y3o3OGpmczZWOUV0TFNHbzhoK1IveW5CMWVV?=
 =?utf-8?B?b1dYR21iZXhPSUxoa05MRUlMWGFkaC9ZbjE2TjgrdURydllBWlhZdVlBd1M2?=
 =?utf-8?B?VzZSQVB6eWkwV09aN2NqZXBVYjVwaEhxNlhsVWc0UHFBNXRMRU9Id2ZjajMw?=
 =?utf-8?B?TjU1QVNhMUlyRkNodmN2Q0s4MUh3TTRjR1JnZEMyYzF0ZXJQT1dUcmY5dGo0?=
 =?utf-8?B?NGxtc3dLNVBvWmZTUlZLN04rNWYyZFRSR3B6ZTBRYzB6bnZUMVFpZVdLMUM1?=
 =?utf-8?B?YkxEeFZPRnJHdU1ibEJNN1F4cFJpUjdqUlZGTjFpcHplNVBSVHlmVEM0UUZy?=
 =?utf-8?B?OU1NN0RUeVV2aGpGM0IxZ0RBb3RCYzF5a1BpanlyM1Vyck84R0hIM2IvMzgx?=
 =?utf-8?Q?pCpFaUyanKhrjBsXqMvyZNIN2pu2GD9/bAEszYYACM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff37d46-f982-4eca-5f1e-08d9a5f10314
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 15:28:00.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrG1l6eE2cVHjxVumhvf62nfRhNtkdtQ4Taq3inuA3uvqEkkoFPRnVdLUpGJswoPQaw2MuGou7ZUZITwSaAJMLIJeEMJxW11Fp9/CkzifEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4406
Received-SPF: pass client-ip=40.107.8.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.11.2021 15:08, Hanna Reitz wrote:
> As of a future commit, bdrv_replace_child_noperm() will clear the
> indirect BdrvChild pointer passed to it if the new child BDS is NULL.
> bdrv_replace_child_tran() will want to let it do that, but revert this
> change in its abort handler.  For that, we need to have it receive a
> BdrvChild ** pointer, too, and keep it stored in the
> BdrvReplaceChildState object that we attach to the transaction.
> 
> Note that we do not need to store it in the BdrvReplaceChildState when
> new_bs is not NULL, because then there is nothing to revert.  This is
> important so that bdrv_replace_node_noperm() can pass a pointer to a
> loop-local variable to bdrv_replace_child_tran() without worrying that
> this pointer will outlive one loop iteration.
> 
> (Of course, for that to work, bdrv_replace_node_noperm() and in turn
> bdrv_replace_node() and its relatives may not be called with a NULL @to
> node.  Luckily, they already are not, but now we should assert this.)
> 
> bdrv_remove_file_or_backing_child() on the other hand needs to ensure
> that the indirect pointer it passes will stay valid for the duration of
> the transaction.  Ensure this by keeping a strong reference to the BDS
> whose &bs->backing or &bs->file it passes to bdrv_replace_child_tran(),
> and giving up that reference only in the transaction .clean() handler.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

