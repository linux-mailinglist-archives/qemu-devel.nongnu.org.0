Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B73E2ED2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 19:18:14 +0200 (CEST)
Received: from localhost ([::1]:41386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC3U4-0004XR-QX
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mC3Sm-0003ol-N4
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 13:16:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mC3Sk-0006kv-3V
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 13:16:52 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176HB3Qe016444; Fri, 6 Aug 2021 17:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=G60vvRHY/jobh+x9V8Lvq3rkeIFI3cQDs7AIRKmcnHY=;
 b=O3TugeF9B1z9YtkvOOQcgW2FdBhi0GDd1DOHq42f1a1OdsNPFNNbdqwzsQrxTqvkg+9Z
 idDYnj7aqqGEGdPRzEO2caG6l0U/Yf5wD3uDKG/8QkLGgg7yXgkkT8HImZ9doBhPhi0v
 C16m0YrZNekGZ0OQdYPheEdVKDDoynUEOKzJDPi6ksTk8t3/kkj7fwdDp9WvQnT4+m72
 dQgkV0rn0dN76oB8U5Nd2osOp/XNHhLfOU189Jp4ClYrrp1x85jciqaT5feG+aRD7nL0
 WEKPL8RxR0vKk9p6FsDTY1I4NNhe4IKbY/PSuvqNUQJjADvT4hBaIDvAfHw27IT/4HBx sA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=G60vvRHY/jobh+x9V8Lvq3rkeIFI3cQDs7AIRKmcnHY=;
 b=BKvHhWaZhyKwA4XU+uhlEE/5dTZj73hEc6gI+BzjwfVEdFLEHxZZDCiY9xvt9FLjO+Oh
 34aJzqQhDuSyKiinM6KyKhGLmF6iPmipuVoRzq1Sl4iBm8yOQ6lJIEoYAV9XqediV9lW
 haCpZXHoI6g99szia9KcE5K652/YTmbYuhUmu2L4qQ2nuWp/FDYx2WElLfPXbv0m6egU
 pVvS9qflTl7NGLqXKwvKQpM/E7SbP3QkgNjKNtIFxHtxgkGc3eLINAe8MO5B7aupODoB
 iTnEJ+7gDcOmi4NgkFiwjtg/jo0sUcl6CcJOqeoqaxhZVs8XSX6x7LxrSLxApbbm0kii jw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a90jusa1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 17:16:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176HFd7M134504;
 Fri, 6 Aug 2021 17:16:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by userp3020.oracle.com with ESMTP id 3a5ga2kerf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 17:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjwC2KCFHJcqn0neOMpBBQ0IhkTN5MrmjuRSzLHfWnt5gjcDOnsjsNn60TawAha/SJO4Kq/fpu9u35npTS6yqzGsriWt0iCWo80xDwerVGUQufC9V+YHlQrjfJlsQ67egkvCJTT/1w73bGeJs4YI6dpJbpUK+/0ntlsh9f5ksXhE4cDiudggS+a9f0z7xwOPa9UzYk7EjOoaLYsWUPbiME+4CmY5Z2NUwh+U2gxy8p9noEkhvTjFn/C+6UidqgUAkxw4nDBrQT+R2uWWzcg7aUaTjTJqZmDZcvPdCaLWMR4y3ln084kQihwPdr9G17qSaMzZWUPBAk60m0/+LE3bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G60vvRHY/jobh+x9V8Lvq3rkeIFI3cQDs7AIRKmcnHY=;
 b=KGsRRjtFYREznNMEhtOjGzBTughZT8Rfai7Tmg8qrtgumm552GoV6y+RQJjSb1VbPhVwVZvc55Rj3QTlHVr1NX7RBBTv6/3pNq9Cwt3SZSgPQ5t/MwJXqwvd4FQNVDAR58RQOjmEpck1skKZNpPJHqd2J4U4Fv+Nb5uTTplknChEMbNQY4nymsXeNkp7SthmvLlHnvGozYePZzOtu7Jvg21jJOoYumPLPnVp11RcLg2b9Kyy/TPwRImVaJmr2sdvJuLJ3LUs/2REjhEG7JDcS3QHHcx8mfS0yrDWkXDTx6S1o3qYrFH8RHAEppwEE9xpX65UzzgM/1GVTdcEDtOl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G60vvRHY/jobh+x9V8Lvq3rkeIFI3cQDs7AIRKmcnHY=;
 b=XLUkkZFRhwoKQZKVFiE7S66JlK/rD3dRZUTKDzKguUCQKkbsMWOPjfr3znLlpouTl+/0+kvkcTvWAb76BWyQGLPLigxpMgI9IodJL5PMjymQoTnEDLpOkVclAyy0lptU0MUoH2UHi9yXDcivGFQ3MgvH81Hh+0eKRp+05a79aVQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1390.namprd10.prod.outlook.com (2603:10b6:300:20::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 17:16:43 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Fri, 6 Aug 2021
 17:16:43 +0000
Subject: Re: [PATCH v6 10/10] ACPI ERST: step 6 of bios-tables-test
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
Message-ID: <ee0dd71d-1583-120c-b5cc-be209c01b47c@oracle.com>
Date: Fri, 6 Aug 2021 12:16:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 17:16:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35803b85-d77d-4ca9-d7a2-08d958fdf606
X-MS-TrafficTypeDiagnostic: MWHPR10MB1390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB13903C0491945023D331124097F39@MWHPR10MB1390.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EUj93yQfEGJs4waNhx19daRkCqvDJ598teoaTSR5usj3OcHHAzeu7aWbKlR6+WrB2+6+gOVzKy1oqYgRsA3GeiM9OpJGGLDvjldZNX+d1Yts7SQh1G5JFXRnXp/rcazpstfhKuEHt5WS3o/19jBtVfDa6vNFhymRXTkyY6dFS2UIgYRlIDdpWmEofmIP7b6ST0QZb/iDd+3fqdLTQR1Nc3EqtVHbk2A0ow0CjddutmDEgzmj3Yx75TctDqnT77X09BJ+ZIDjRqECSrfFZw6yUumANNcbqLZfuPoV2rjztqrfWSF+XzbB3pk57JdiVg55+ZcUep21mmAUMTG7FmvBUVRfWy9ThDYVB17jaNPiu0TAoM7TZkErG8ynbYHbVDb6DQPPMpDC9CU3V/P59Xm6VEcxJGbdqhC8SRazmH6eHmITtaXFykbhVqr122kJatYTMES361l1HQRLfVYcMlLP0fF3y9f4/TpZysvfDmS4gBIDxy/4DBrNouw+7POvovzDTzmpG+ofv7rbGKcsVxoQNfTWRmHFalVP+He+FgpjJkkh2cIGD4mcFrtuOd8cLJKnOdU60vqAF/YPZAsJcB/IVSk8cyW0sorTxuJbegn3ceOr41COWP4FnMcLEchodlGQ0zLHrOlwW0vq6ogdHswqblP9upwVxthnxe54ldO7OoaO2N36K1gkxtvG9Ijm9F0PsiQEd3hKGiH3OdzvOVLZ0MDNUPv7ODIgKpzEpUXJd+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(346002)(136003)(396003)(66476007)(66556008)(8936002)(2906002)(6486002)(86362001)(31686004)(36756003)(31696002)(66946007)(53546011)(186003)(316002)(478600001)(2616005)(8676002)(5660300002)(38100700002)(83380400001)(4326008)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?Q?cDuZsyUyZt6/y45Sdqn8kJ4bE52lqVHf9pg7M=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35803b85-d77d-4ca9-d7a2-08d958fdf606
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 17:16:42.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQSX8F3toyBlIkXU1Aa6bFkHdCALNDyO2rMVBRvOXxhhzC7uFXxljyo0U9Yw0i+dGIBnSGv0CKEpUofetK3I9gXWpStKaRo//x2v4ZLLc3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1390
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060118
X-Proofpoint-ORIG-GUID: CLMJEWcuuC0ZejRCtA0-p7vD28Yv5VuO
X-Proofpoint-GUID: CLMJEWcuuC0ZejRCtA0-p7vD28Yv5VuO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Well, I discovered today that running "make check" again resulted in
bios table mismatches. In looking into this further, I think I might
finally have an understanding as to how this is all to work. My
bios-tables-test-allowed-diff for step 1 now looks like:

"tests/data/acpi/pc/DSDT.acpierst",
"tests/data/acpi/pc/ERST",
"tests/data/acpi/q35/DSDT.acpierst",
"tests/data/acpi/q35/ERST",
"tests/data/acpi/microvm/ERST.pcie",

and with the corresponding empty files and by using the
  .variant = ".acpierst"
in bios-tables-test, I am able to run "make check" multiple times
now without failures.

So, that means patch 01/10 and 10/10 are wrong. I'm assuming there
will be other items to address, so I'll plan for these fixes in
v7.

My apologies,
eric


On 8/5/21 5:30 PM, Eric DeVolder wrote:
> Following the guidelines in tests/qtest/bios-tables-test.c, this
> is step 6, the re-generated ACPI tables binary blobs.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>   tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6009 bytes
>   tests/data/acpi/pc/ERST                     | Bin 0 -> 912 bytes
>   tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8306 bytes
>   tests/data/acpi/q35/ERST                    | Bin 0 -> 912 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
>   6 files changed, 6 deletions(-)
>   create mode 100644 tests/data/acpi/microvm/ERST.pcie
> 
> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
> new file mode 100644
> index 0000000000000000000000000000000000000000..d9a2b3211ab5893a50751ad52be3782579e367f2
> GIT binary patch
> literal 912
> zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
> z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
> z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
> zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
> LOT5z?_v4Aa+v(5&
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
> index cc1223773e9c459a8d2f20666c051a74338d40b7..bff625a25602fa954b5b395fea53e3c7dfaca485 100644
> GIT binary patch
> delta 85
> zcmeyQ_fwC{CD<jTQk;Q-F=QiG057Ni!kGAAr+5MP$;rGe;+`zQh8FQ0@s2J*JPZuX
> l3>=QZp?+M<lN)&@ggD~CY!RV&S1$v`0B2XP&5C@1oB+Xc6m$Rp
> 
> delta 65
> zcmeyV_eqb-CD<jTNSuLzao$F*0A5ayg)#BLPVoW`laqN{#GF`y4K3n1;)6r|xR^QO
> V9bJNW7#Nr*U*I#`Y|7`t2>@&@5ljF8
> 
> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
> GIT binary patch
> literal 912
> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
> R+q~0XMSexT%^U0Ee0~)`g#iEn
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
> index 842533f53e6db40935c3cdecd1d182edba6c17d4..950c286b4c751f3c116a11d8892779942375e16b 100644
> GIT binary patch
> delta 59
> zcmaFp@X3M8CD<jTNP&TYv2`OCrvjHhYfOBwQ@nsX>ttC4TZ!l<{$N9cc#e2SmmnSn
> O1||j(wg6|p5C#C(xDBxY
> 
> delta 42
> xcmez5@X&$FCD<h-QGtPh@##h`P6aMMmYDcpr+5K3mdUaTw(KHo0nUCQ3;+kH3ZMW0
> 
> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
> GIT binary patch
> literal 912
> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
> R+q~0XMSexT%^U0Ee0~)`g#iEn
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index b3aaf76..dfb8523 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,7 +1 @@
>   /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/pc/ERST",
> -"tests/data/acpi/q35/ERST",
> -"tests/data/acpi/microvm/ERST",
> -"tests/data/acpi/pc/DSDT",
> -"tests/data/acpi/q35/DSDT",
> -"tests/data/acpi/microvm/DSDT",
> 

