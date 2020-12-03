Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66E2CDE85
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:13:03 +0100 (CET)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kku2I-000496-2D
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kku0n-0003bW-TU; Thu, 03 Dec 2020 14:11:29 -0500
Received: from mail-eopbgr60130.outbound.protection.outlook.com
 ([40.107.6.130]:26854 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kku0l-00065s-4S; Thu, 03 Dec 2020 14:11:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5I4FAVFcTQCkodHWIhzOU3MBIWDFgBHoKymb93VYkTs1UHZj6UqTk/EqVi5TVWAS3lXdAgfrvsDS+dVUusfsltYhaXKGooezqm/WpZcUSGrXtnf2VTSA02u14JAMgcb6MYFua68pSG5JtzZAeiJTVhkTQUBziLubX6pYvXjM7PmrLiC55xresAcFgOhnPvsDn2L3fklpCFotFALEkJRNW+RtsJ/FgUPd54aNY+3rF5GwHHgShOI3VZ50qQEcODvjgdO+FlGpS7IO402OEbl5XrR9qgjoquIzCxTm8bsAlW4LMXYVe00k0BdKsLtIa6UnRNw+ElMEk4RR94CBxqXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuPChI54YBMCyG7xy7e1ycZ/hGmG7hKuZN9nAQor7r0=;
 b=GWagG/HoHm0c94VdwjhDQRtA6Tfcg8xzca5lpZpbB8FjawqSWtjBz4+XjKopyP/wz/D6hnSTC8BwV+it0BGL3U7Bi6KhzKpCJkVQvMAkzR1f0eaJr0KXBnhg4FIOzfEphTah0yag51v3OZjMyLA71m1n6KW0DxpV1TrU3SLVwIEzp4haFoMEnnFC8dr3JqvMcUl0RA3qr0W4/a/A5iAW6nRnjveYNTiw+fcYVCNdx+4ihE6v0jP60aqnlAjc17So6FcV9fG/Cpeijvt3VrN8glu1eFYGWtLmE+MIcJ5CGgohNN3jyY0hDYakf7yE+taBii3BcreJKUMjPQi+WJAmcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuPChI54YBMCyG7xy7e1ycZ/hGmG7hKuZN9nAQor7r0=;
 b=I1y/zyqfdeiWyw01Qp1M2VD2mRIPCzVImANHvzUfM4AgyOs/qH+Cb1lLPa/gd+BfOQow6JMTrqj3APR0IxcPpOeiT/yECBKXEDprUswEyzGSVIsp8vjjuNpAeNYnHkuieHyueNmN77T0NoMIbqqZYH1rZdM+z3lciR2JXn1KhhI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Thu, 3 Dec
 2020 19:11:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 19:11:23 +0000
Subject: Re: [PATCH v13 09/10] stream: skip filters when writing backing file
 name to QCOW2 header
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606933861-297777-10-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bc6bf274-6d50-c8f6-405f-0966a1bfcfa0@virtuozzo.com>
Date: Thu, 3 Dec 2020 22:11:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1606933861-297777-10-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR03CA0003.eurprd03.prod.outlook.com
 (2603:10a6:208:14::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR03CA0003.eurprd03.prod.outlook.com (2603:10a6:208:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 19:11:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e40471c3-dbd6-4d04-7745-08d897bf395b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33836D497680E95133D7CBC4C1F20@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQPMpmn24bqMCAQBwNC/zaN0FmBrdey/AzWqDQNERiSGsYpxC8aMBsvPdGvhTIsqurbm6XWk+NdwXKK22Ltto/qVEbuUVdGrljuacf1TFPO/4f0HUwAIkgQktyWHsDS/Ir0vWNB7RI6ak7QcuYV5JzuYqkbqfV+XdUR3qN4O6IUby3Pr6YPkruTV4kZ432zEYTFkHI2eVY3qrKEotnXUG3dc3KeD/wTSh8BmEeQEaS0rV8UwBbEDducVz3BpnWPrj2rQ8xGw6pJmxC3HU+jVSsMep3Tqe0dZxcfDNK7SIdLCzzX21Eey46lE6qXxeqelo79lu4IVvry3Bnt6pKc+yrZEThAObL9mOPsR+rCU2EKovkpLmNOcuBnPyYn6u8ugZjy4LpZm+5DVMv+XYefGJRAB0oAGrBdYxputQWM5TSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39840400004)(366004)(136003)(36756003)(31696002)(316002)(16576012)(2616005)(86362001)(956004)(5660300002)(8676002)(8936002)(6486002)(66556008)(31686004)(16526019)(83380400001)(26005)(66476007)(186003)(66946007)(4744005)(478600001)(107886003)(2906002)(52116002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlYwTXZsVFgzNHJQT09VK0F0bmJsYm5URVVOSFA5TmlOcnorSmZXd05zNXRm?=
 =?utf-8?B?ZzAvdGxJQUsyYmtzWjNkQTJTMmhoNFh3RlJxRlE3NklZazYwNTNGS285ODlq?=
 =?utf-8?B?U2ZDV0hCUjl5VUhEN21zYlFZMFUzbFZHNHpmQ21BaEFzb2JDdHZkQlduUERx?=
 =?utf-8?B?RVRmMmdYdzM1cjFNSDM3cEF3QmY5QTB2ZmpZczdFWVlRdmZrWW5zN2xYQUlW?=
 =?utf-8?B?S0pVSGRiVC9sa1R1OG9aVnF1WTNYK1dnMFhnNXhGbXFYMVdtay9IRW83WStQ?=
 =?utf-8?B?YVRQLzYzTmdKUjhXVUtsUG12ZFRyK3JsTW1WOFlFTmFGTVVJWWc0NWJjU2c5?=
 =?utf-8?B?aVcwUzVoVU44cFUzMFo2VHBTV3B0SlNkTlJSVytVWU91cUNnSG43SjRoNDVt?=
 =?utf-8?B?Umh0bzF6TGU5T0JLYVY1RWdmbXlRc0ozdkVMWkFrY3B2YmIydWJmT0M3RTJO?=
 =?utf-8?B?TndWSTJ0bFJWUmk0clNBdlNOc0pvOVBXVm5FTUpnNE5ZcXMxT0dRd0dvNjFN?=
 =?utf-8?B?ejNtSzdGbFhteUp6S0VZZ1ZPd2ZuSCt5aXd6OHl1M29rdlUxTjFtQjQ1dTVz?=
 =?utf-8?B?SGRXamh1dWJwUFE3aFVXRDdOWnFUb0trNkdTWTVGRXhSTzY5T2REakZzMVJG?=
 =?utf-8?B?V3VPdk5RQUNGcjU2Q1Q1YzdnWURJSmFjanoveWtCODBwTWN3NGNaeDJqZS9z?=
 =?utf-8?B?M0tndk9ydXI5NlhJY3V2TmRKelBtZVozQUVHWTFnejVJekcwSXIvM2lwaktR?=
 =?utf-8?B?UFFKY2loUE5IYzBVL2lneGZPZ0V5SmY3c241ckVheXNTcHprZ3ZUMytsYzZ0?=
 =?utf-8?B?eEhiUE5GL245aWRGWE9BbVRFeUVDV3owK3ZieGt6UUxRc09VUFpwZHJZcmM4?=
 =?utf-8?B?ZDI1MGJyeGRkRUFvZ0oyTkdzY1pLNk5CWTlMbm1LcG9ZNXhON3Q3bS9BUkR4?=
 =?utf-8?B?NGZ4aXVRL0xUQjF5bHNZSmV6eUQ5dUNMUDNHcm5jbUdrQmFPVHpWN1loRndU?=
 =?utf-8?B?bFZ2cTJNaEhGbVUvRjNOdldoSmxTeEhjRkxGV3k3VStESUM3aXNGc2pDcmMr?=
 =?utf-8?B?S0JNQndxUDd6QzVpL3BJQit6MnNHd2ZocUlVcnBOUW8zc3Bpd3dpc0NXZDNY?=
 =?utf-8?B?d3JDSVA0WXdOcm15OFZvYUJOUVpLeHVpRFVpdGxFK01PNW5rUjJiTEx1dFBq?=
 =?utf-8?B?MzJpNzNadDIyS253RVZhbHgxMTBPby9EaGxWUkN5YWE0T1hleHpIeE9TVldC?=
 =?utf-8?B?RkZGMzB6YkdVbHBsbi8zVGdBM1FlWmNFVjFNcTV2ZVpPWEdGZG9IWUQ5VDhn?=
 =?utf-8?Q?NNBQWzF9oQZWsIPexgo6UxAFgDkmlpKabk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40471c3-dbd6-4d04-7745-08d897bf395b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 19:11:23.2436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMuYOOkzN9Z55mWDwyv60UJwLWyOAG8R0ZjbPIQuhuuGDdMBWX6tSX7sB3kxRCS7FTbxGWfk/TaOtpncYOW6dSpXmeNixKw43HE2DyfayoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.6.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

02.12.2020 21:31, Andrey Shinkevich wrote:
> Avoid writing a filter JSON file name and a filter format name to QCOW2
> image when the backing file is being changed after the block stream
> job. It can occur due to a concurrent commit job on the same backing
> chain.
> A user is still able to assign the 'backing-file' parameter for a
> block-stream job keeping in mind the possible issue mentioned above.
> If the user does not specify the 'backing-file' parameter, QEMU will
> assign it automatically.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>



-- 
Best regards,
Vladimir

