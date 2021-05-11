Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C040E37A43B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:05:01 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPG8-0003ja-Rd
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgPDW-00027H-GU; Tue, 11 May 2021 06:02:18 -0400
Received: from mail-eopbgr60099.outbound.protection.outlook.com
 ([40.107.6.99]:41868 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgPDT-0004IZ-4C; Tue, 11 May 2021 06:02:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJWc6wxj1FZjX3/jzoqWCq+7XHKpxK8Iln/RcFWjV4GJVVH6HSTNm0BsNSXPlmHhBunQaXaJvK/88d3F9K5GomkwTTxiox5dzWUMT/iUNNCqlWEw88oPJw0zy3YJ7zzKgSp9QUoWEvt87Gz3f6W1qX2T5wXPStk/yz65HQH0ut8YM1nAH2wb8UWwtlMsFlyXEtTn+qvJh9Vkp3sDbvCjgHOm175pty3Oypy/7emV8zKeuhz0w5WNFNkz3uPyiVDpXYUZucV83535vLlx1snoqC6lRJehvKssefmREHfHbrOpns+7N6Bi6+T5mybHPJ4Eofk5v8ueFchKRw5BkSCdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izf7O8oLvbLnLbkPh4x5CWxymawrip5tISXRLrZUcK8=;
 b=LIen04TKBwJESyz0KvJzq/+I/kh5ZLuq7lkMstXp8r8oHzO4JMaSyWwmwd05WaoJdozV3QrR2CovqnU17YsxLO20bSQOAk2ioS/nzPQaQLDAzVM0xd7bDPAyMhuN7gEns/TjXFw5dnOl2OkIWOUjWgEhgE0t8UJNtkRIv/WjVt/91R5UYLT0ctAM3oR8NUObh38gb0rFk6e+CkvUjoEYglPb/fHeyeQ4bvA3k77BhT6cFVnkV5AKcZ0ULu9yJ9GTQNKUmTf9+toVjY0L6FOmPMD4CmWcCWxGNw+YaE1laOcEVQABXeeeZDqX7N4m9ZPsRw11ylv/HTcXB7S+ZqpZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izf7O8oLvbLnLbkPh4x5CWxymawrip5tISXRLrZUcK8=;
 b=Foicz7/DBexaH3Pvr8gewxgmo9WSBrV+kS0qLToxmoUkxpFDxDkIXhOxe14sbdnnWLjYSoVSDxolczF+OmpN88a6PyHpygALXWzojUbRrgM09tJVEr2hWfbu5xCu4yLzLWNVY3ICoAe5hwlU+v2v/EkPn15RKzQUSHdzgxNxZjQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4851.eurprd08.prod.outlook.com (2603:10a6:20b:c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 10:02:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 10:02:08 +0000
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
 <e54ddd00-b0c0-a998-60fc-ab491c23b5f7@virtuozzo.com>
 <CAFEAcA_GEth6Ar9PW4YppAUgQ2+20iCZKLnB-AYATeiHvc04VA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a10b3781-5a88-08c7-bb2f-d274685b150b@virtuozzo.com>
Date: Tue, 11 May 2021 13:02:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <CAFEAcA_GEth6Ar9PW4YppAUgQ2+20iCZKLnB-AYATeiHvc04VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR3P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR3P189CA0064.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 10:02:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37ec29c-5005-4ed9-f04f-08d91463d697
X-MS-TrafficTypeDiagnostic: AM6PR08MB4851:
X-Microsoft-Antispam-PRVS: <AM6PR08MB48516239E19569216EB6C72DC1539@AM6PR08MB4851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XkB02s8VxVz3/yNO6Az7RtUL98NS3brmCLARcmgChmxizy0DV2UExtk015iyV+Si7uXmap7CDfuqkCRny+aaLV+ZhVFI4ekEcMxIo2kD+r5GPbuhNV2YPKQhdt64IMtOEtA/T25wTP4QKdCrl7LokWkICAs2793FlIAKeGdwjkg7lOkgXQbDmE16CH3bC4AF9zdL07pY8CnR6F1j8msHDR70ZZteJnUQDY0VjKyjgfw9Ku8giuiq9hN0yULYlIYLAd+G2iu4WsqKxNq9mwIw6Pc6ld0qpsW3aK0oCjb5tHVHu6xLDEnumZRmHRHPttY/DsyUErfTVTX0ivarNGLUIBoLjBxuXCXUqP5bkIu1TDADOi9ptn4x7dYMrM67rFgwPTlGCHNX6tISuLSAo73peLOtizJGn34+2gMead3u8DoQvTCXRGnPjnp7G5/ARB/uYEidMwPAuzUtYDn+lm1438m5uKR2FzdAryNF0jwetd63IetJzKN38ex0BMaVaiEce+Dlr/HkrRmpUWJ/QMXlZTv07WqIHcj/CODROypb7sopYzgMz5268GDSfJmxyFmgc5l1pbcKVAHerBKKYSzulfYxyTDxucDviKd5NOiG2643Gn28hcUrRpTBlqEMVY5NKKLOFOZFij+hOgx+qJazVVe/ubCVC+MqgInfu94gpx5xqtoSQV0N5V/1zqR0zNRslXPAEdDgLWfr24YBNpaF24rB7XkX0CILkH6hpkYM3Ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(136003)(376002)(346002)(4744005)(31696002)(956004)(186003)(86362001)(16526019)(4326008)(83380400001)(2616005)(6486002)(38100700002)(36756003)(31686004)(478600001)(316002)(8936002)(5660300002)(54906003)(6916009)(52116002)(8676002)(16576012)(38350700002)(26005)(66556008)(66476007)(2906002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlNsOGlKNEhicS85TEQxMEhQNzZXdnR5dnhIY01pVHAybmkwV3NRbWxhV3dj?=
 =?utf-8?B?eUprdldXTm1vNXgxelNxbVhZdldGeDFtM1l2RXRxQjVHRzN3RG1wZndwdGxt?=
 =?utf-8?B?RUNRNzdINDNvb3RtL29IVklPMkJhamlua0pDclh0ajhSWGVLMGp6M3grVE03?=
 =?utf-8?B?TUt6UHlTd2oraDUya2hrL1dEcmJlQnFkbHppNEZSdnUyYlBPNTBrbFo1Tmgv?=
 =?utf-8?B?QjNSU21YL2h0TTU4dkpnOFhQdzFNR2FpRkdFMkRLbTlHVTBIR1JFV2pwZXZk?=
 =?utf-8?B?djh3QTlxNEcwVVpJcnpUOW9nMzlKanJyNkFjUVAxbWtOeDFUV1l2b1RQTk0r?=
 =?utf-8?B?Y2Z0eXNvSTJ0SVN4R1R1V0lyVGkxekF1ZDhlL3MvRWtQMi85ZWxGOHpjZTNW?=
 =?utf-8?B?dm04RWcwaExEa3RveWVtcjg4V3ZIaU5nVm4za3psM3FYQy9rbThJc3VXZkhX?=
 =?utf-8?B?TE4zYWNSbTF1TlZlNHRjWWhlTjEyb3BBOHBiSW9qNnJhaThEYkdFWitUd1Yv?=
 =?utf-8?B?NnFsSlJ3UERSVEhpaUg0NFF3VUJLWDd0dDFhd1M2d1IyVUtsUWdoWGxBS2J5?=
 =?utf-8?B?TFpvdXJaeDFhQ1laak1xTkZxYk9PRExqakNZMG9MTmxUc3FacUNRT0NWWlAy?=
 =?utf-8?B?Z0Q3cDVpTlRNU2tQcGpqdDdUS3ZZNXZTMUdGQlhqc3BKM3NhQkg4cTIzeCt5?=
 =?utf-8?B?OEJzR3FDR0NXMEVjVXlKb0Z0N1M3RmVaOVYwcDI3eTVDVVJEZk1HWGdkcWVC?=
 =?utf-8?B?RkNOUW9QSm9tcGlHdmhhSmVUQWRHajlsK0JXNWpyb2lLcGFJWHhFR0dYVklu?=
 =?utf-8?B?M1V4b3c2YkxnQkdqaU9kRGtzaVkzbG82QzZ4RVhnU0ZjNGpDTGRtTHBqTEpj?=
 =?utf-8?B?UVpuVGM4TTVGVWhsMnkwdWpOa09SSVZzQ00rdEszYjcvMStwek5IM2tsb0lz?=
 =?utf-8?B?K2c3UEUrdVNiaGVqWjc1ZDVyc0JhYWJkQkJjRlJjU2ZTd3UxdEpKU2l6YWgx?=
 =?utf-8?B?dFFHb215Q1B5c3FNWW9UdkE0czNVM2xGcDZLajdBNXlsS21nTERWMGQzazhn?=
 =?utf-8?B?ckVickI1UVRMUDRYckdxOXBVUGJ4UkJ3a283UVdwUlA1VVR2Q1hSUm5rd01W?=
 =?utf-8?B?TkhGajRORHFzZGxnSTNuODBnOWw1b3NzYkkzZjNvbE5aamppbTQrZjBTOTdu?=
 =?utf-8?B?bnVtYlExalViUnhZa2EyVVBCYXVJWkhyVWRYb2t0ZSs3cWl4bTJnN3F5NEx6?=
 =?utf-8?B?bFQ3alhaeHEzT2VIWGdYWlJsbGxpRDNPWnBIQjF0WHZaSHg2MkUvdmhwOHg0?=
 =?utf-8?B?RzduZDZ3M1Y4NGYxbExyL0Rpa05KbklMSElCZFpjaG85YkdITi9QVGlEaE0z?=
 =?utf-8?B?VG10TEp3UmxDTmpMOEFWWEVBSFNtL3ZQMzU5V0swdG5zZEswWk1Laks5a3dO?=
 =?utf-8?B?dzFQWlpVNWswc0RCbWxCaEpWdkI4WExyV0RnWjZ5WUhZWWdXY080SVVybTVC?=
 =?utf-8?B?V3VONXoxcnJqRFBoTERNaDQ1b0Zjckl6aXBRc0xlSWI0ZTZ0SzFwQmd0ZlUx?=
 =?utf-8?B?SnFIQzY2Wm1KeWVGNWo3Y3hjbm5DZ2tMbXV1UHpMbEFkYVhNL3ExWHBCNWpu?=
 =?utf-8?B?emVhUDZmbk9ST2lXSGV0NjlEVGpIS1lVd3pxRWlJeHYyaGNZMFVjQjBrMVJC?=
 =?utf-8?B?b1dGZTZnNHpBanR6a1FYMlZVU2VsQWhLNTJqQlppRWQ0ZHRXZWdSMGdZSXZH?=
 =?utf-8?Q?ThN/ZrJAkPn8VO3xI30BprE5EwmFBBHQL07Xaat?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37ec29c-5005-4ed9-f04f-08d91463d697
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 10:02:08.6475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPCvtrTj7lvj9NCDhPXBtl07I+d2v2mvFETxYTIY6NO96h389aV6AWTR5BB0dRQd2RGnl+9Q1N44SaxIcUaVrbSXslV3I0wC6CULE3Yk7ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4851
Received-SPF: pass client-ip=40.107.6.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

11.05.2021 10:39, Peter Maydell wrote:
> On Tue, 11 May 2021 at 06:59, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> Hi!
>>
>> Kindly ping, or what's wrong with it?
> 
> You've never sent me a pullreq before. Pull requests from new
> people are a pain and take more time to deal with, so I only
> look at them when I have the time to do that. Pull requests
> from established submaintainers are easy because I know they
> know the process and they have their gpg key set up and so on.
> 

OK, I'll wait)

-- 
Best regards,
Vladimir

