Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D703D3D8F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:28:36 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6y2N-0004S0-SI
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6y0r-0002to-GL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:27:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6y0o-0003Nq-QS
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:27:01 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NGD6mf000660; Fri, 23 Jul 2021 16:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3vuFilBDpkwzAmGDGiUrCmzSzPd5oIHlaY4Gh25wQC8=;
 b=v78cyF9EPOMYni0pyj22Hv6ehr0qugbjh6H8/X5JDb7p5BaRrSNBS0LlWERw9QoCw8Oo
 IBDYYJuawB3z09cNcuSVu71Qye/xhMCdzXqgAgtHNxfxBYQKPtA2yIi/9E8dEgou3fHf
 24ZHvBxiV7FVga6ES+JX3y0PrlZGs43Eflx6v3hIJmRCE5NlOKVWUzj1gJbCJRo54dyG
 YlDaj03C8t9Az9k2KVxdo83U7odZd6NcmttMzDF1D/QwAAmbAuECD1dWjSLR4/PKEtZj
 OTQS7ntZ20EF2AxR4R1tTPaeiNvDOl03G7S+/BK7DrIeZFDov8xiPoTx9YaGR5Pj+FzP xw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3vuFilBDpkwzAmGDGiUrCmzSzPd5oIHlaY4Gh25wQC8=;
 b=suMIKSnHmFwovb9x0WdYIu1pE0TEQpHm+ZfPIdJg3t+3rCG1ojYf436jkUJHlTqyoslc
 xIheAiBMtn79/I40Nf58zcI/93e8/nL5ugCSjNwZK3ubEjq/2iKxEABULPcTAidvx73/
 7TyA0hLoWhF9fN6eqAb94Ju5fPTNpZFa4c5OHJKhy2rvTwSzTnHv6xSbk/uQBDeAsBHe
 tDVMosPs70uC+/pi/y6SF4i5KGzKBVy6WMfPi9avK5gCI73VRF3JLFifA/hd/M/N/Gch
 T3PJqsu728cvrnvK+ZDGV285ICaTHzKiQ+jA30eLTsxhGQvvVZexau78tUyJxPsChDSE lQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39y04dv0wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Jul 2021 16:26:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16NGQg41140892;
 Fri, 23 Jul 2021 16:26:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3030.oracle.com with ESMTP id 39umb7bvuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Jul 2021 16:26:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZr35UhDkllaIpkVRtFecQHoGsWRZpfKx3jszt4FAMd1a65P2GmcisPEypPxmfzVjWYXkp1h9tNauoZyhp+9Z7jLDzv+Y2Q0gnQ486S+wmQIsW8DSdA6QOg7UrPRrpAfVOLv/nt69F+CppV2UXafXCJh6gGr9OGb0cSgTYlxSNp9Cw1Gdi8ywRES1pI06aV100+w1iJjomRIDc7jqckf8RM/NgHyYAV6BoxwrpUH8Jj+W5FIxyzDY86ud62jGXFj9hZgTPENGR+TjhUvdK7kO3EUJzT25eg3XaMKUZ1S5VAVvLAZ6VOrwN3iizn8k6VBRnCnS7/lzzITy5AfWKQ0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vuFilBDpkwzAmGDGiUrCmzSzPd5oIHlaY4Gh25wQC8=;
 b=Lpp2AAZxKF4kBdgiE0N7/MXCPItbb5o6iqk3tVJm8MTXOb8IBXpOO5yxfZc7CwjIp4grP0/kWalPzmkyHHrbOmo80KfhTNFXz1lIuIwwSTw7wK87bKt3WmW7ILyP6nHksQtArOQ7in0VTXVc03RrF304Ff3KnYkuuqi76gKKvj9vLUUY1XZ4K0eQUCSD3ae3Q35qVv4AYZaGEOE6J3BtUDW4+QXOLEB/uRieiBCTw/sxkj2HFKK4IP3CoPaSWq7nk5wGUGe28dc4jcZ7KfJftyIPmCMvy2wUm8zI1NE6uNUkLe4VBEyjKJm9bfU5fxdv4C4nXD6AXc41n5e/BxcyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vuFilBDpkwzAmGDGiUrCmzSzPd5oIHlaY4Gh25wQC8=;
 b=HdTlhgqojq4rckAGW9iTbbCuEQ7IYFyIqki/7mmmshClK6xbc81NXebGjGzmFVsH1BRv2c708OwKkwSiAv/YQ81h8zyt3mbCdTtBs97g7viyzRdN/ZGV3WBATQ+GJ3lSg5EdWSWjNpKogTL50QwMXTOTrOxYlSCewqDW17JvFd4=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1454.namprd10.prod.outlook.com (2603:10b6:300:23::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 16:26:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 16:26:51 +0000
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <20210720165751.52805aed@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <d0b0cb42-6a68-3740-fa2f-5d6b38cc69b7@oracle.com>
Date: Fri, 23 Jul 2021 11:26:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720165751.52805aed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::24) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA9P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Fri, 23 Jul 2021 16:26:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60344296-ffce-4c43-3cda-08d94df6accb
X-MS-TrafficTypeDiagnostic: MWHPR10MB1454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB14547A7EB42150CE3133EF0397E59@MWHPR10MB1454.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UK0f5wjH+yuRzw27/O0aGwcMnS1B5nKTkW/iOG5x6Gi2Im4XobBhCmfAJua8jnOxJ5xbm0xiRVI6xTaLdjPJK+40xk9esIFVrxbcbhmX9QJPLDNYVEpHFssERgWFzd+PbzcsZM5gNH+4wYtHMHFO81wtbjnTIjXIbBnlhBzKtC4ngX8BBNjP0QCjt9wfKKfZe3JMFF72xXvJhBrTTmd+s+XtsKCcBwSW8klV4ytiwIbtmd9Vxlisu+0ou+IAop86ZzuddkuiJ6RcXM6ZUEbs6MMuWzDz92XYNGpepYuJwMjnyHMeBdIAcCG282VkMk3ExdvHDJkZRCDcydsykXawsLx+JWhXjwntlJJbEvl8XBZ8lS8OBA4LJF8oCHV65E4HyR8WqHX5Dt6VCKGwjwv+G2JzoiREja7m4A0uj9y+savnhynhXXaPuLOLCUtTb7DX/DiPxGnRhMW1k2vRrm9My+CTO9MjO8K1vfiGUga1gfi8r4a2AWRxaWb49pgkySizLraQCWnCoNcBX9KHa2TNOp/aTI2vZp6rA2u3DUv4r8aLjOtYcHFlw4e3oclaVJBNrvUieYCkN5s3nHA3oUHmNmU0JxVDD6JzRT8NYZUrYMYw+aBBqfkgmFQ/z+Lal+KPJUHKByixKcvlBuLKwnngR4Xp/pxC5f9exO72s/VOG7WY0X8mlcp3HM1LzjcqKBhkVglCVIAIwu6ZDSMdbDuAI2hoD8ToCLjopkJdDbe0rJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(8936002)(38100700002)(8676002)(31686004)(2906002)(53546011)(86362001)(6916009)(31696002)(36756003)(6486002)(4326008)(5660300002)(66946007)(2616005)(66556008)(66476007)(107886003)(83380400001)(186003)(508600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXhKM2w5ejlsdkprT3dyVWloNmhGdDJCa1BRNjlTUVhPdGFxSkFrNGZJNEtl?=
 =?utf-8?B?dFdTZWdrS08yUnJrcFlyZUF2Y3JWajcrZWorMGd1UGlZZm1EVFgzS0p3S1pC?=
 =?utf-8?B?OVI0bzhpWnV4UTJnb1h5Q05NSkVSTXVBVU9XRDZUc3FOZWx3bTAxcUc2NmUx?=
 =?utf-8?B?OGdLcG16a2hxdXhtZGhibFlSUU5CMlpuOEF6NVUweWFyU2l0Nm9uWXcrYnQ4?=
 =?utf-8?B?L1lPd1VQYVY4dURHQlBZUm9EVjVUYU5JczNWd0EySUFKUFJINjVyOWw5VWxq?=
 =?utf-8?B?Qm1USlZHNnYwWFY5RThKRVBZV1dnMENQeUZPdVpBVC9JeVJZM3M5cXhQVHJz?=
 =?utf-8?B?ekZiWElVclY4NU9XMTFRR1d5Zm0wR0NSbkZJdkNUd25aaW5QWFZOT0p3aUV6?=
 =?utf-8?B?V2N1THNaa1VpNFk1MjdKS3Z2eUM2aE1obVNGZWlIL3dXZ2R5bXhPQXdRVDFT?=
 =?utf-8?B?TUtRYVZTenVOWGZicm9yVU5xd3dtZEJvWG9TclhFM1hOK3NHV2RKWDJ2Zzdh?=
 =?utf-8?B?M3cvYWlScHl6V0t0QXpSMlVBRG8rK2laWnZlNHhkSGMzUG1qZnpaRklIb2ZV?=
 =?utf-8?B?czZyQ0lWeUZMcCtDejZreUM4eTJzdTMyeWN3S2VHUWMrbzJob2crMmlBMVQr?=
 =?utf-8?B?T0RJanVlNjlsbnJtdXdEZURSU2dLa1AvUGQranRVVUQyUi9wcGxpdnFuZVlp?=
 =?utf-8?B?UUZHeHZMTlRWRGQxUEJsdms4ZVdBb0dnSzl1K0FDSUxQRkd2b3lBNkFmTG14?=
 =?utf-8?B?Z3RsTUQvTUNRUlJGWlZOTGFSUnI2Rm1UeTUwaEtJVGV6ODFSaEhXNStDOVNK?=
 =?utf-8?B?WU1YZmxtSC9TdXNBVlZlU3NWaGxVS09QdWd0YzlROGoweFVOZEhONlJVVGFX?=
 =?utf-8?B?cys4WllDMkkybGNLZ29raDAzc3dhcDJDa2JGdTNqRGxWT09JRGlCOFdxejhz?=
 =?utf-8?B?M2RWUml4YUhkOVBSWFkyeDRtcnlzNlM3WE5xNHZtVU1Ib3UrZWlWRUZSOWh4?=
 =?utf-8?B?ZUZvdmZJVTQ4a21LWE5hTnNWZ3hWbGxpTUhRQTJRUENkNk14UllzQ21tcFpF?=
 =?utf-8?B?dkgvUGs0dXVPaUtKMlBvb01DUmNtcWRwQzNLalZ0K1FoMm5jQ2VwWW9RMTVs?=
 =?utf-8?B?UXN0WHlCUklIQ1Y1am82dHZ0SmJ6cXM5SDhnVEtrUC9GVFp3M2hLTjVYTUM4?=
 =?utf-8?B?MEo0WENoODN4OXF5bWtudFpiQW9xaUc3WlV5djF3dXJZU2dmanMyTVp3M3F1?=
 =?utf-8?B?aU13ZGZXREh2Vm8vQ3VoSzZxbUhhYmhybHhaUDdybzRrbFR6SXBkdGI0eHlr?=
 =?utf-8?B?ZUhKaHlJSXdBRVp2N3dJdXlISFMyMkNYZExZWGVhVXUwajZnT1VBVW03Sk1C?=
 =?utf-8?B?b0ljbHVEblpYZmRtemlHYWdYYXBvUHBEQ2VzckJrZjluL1greUF2ZlRqbXMv?=
 =?utf-8?B?Yi9VTlhPRlI3UVFXN244S1VzTVZzMTRsUjljekQyN1FraFFDU1diNWFSOXps?=
 =?utf-8?B?SjNKL0RKcm80NWl1VzgzcTJoMzg5OUFDUkpPbTl1SkJmSk05aGR2RCtRYmtN?=
 =?utf-8?B?WUZHeEYxZWxubnllY0FzNUpqeVdRZjhwT0pnNUtaekJnMWVpcHBHdEFpREZo?=
 =?utf-8?B?aTVLUTEreUxKdDh2cmpFR3IwV2h6ZmZ3RnFMM0JhWlBPay9NRGJSOENKY0RJ?=
 =?utf-8?B?b294RTR6anZZZ2syaFEyRnFWdTBLd3FUanJRWStHNWxwK1ZPNVVubnpITCtr?=
 =?utf-8?B?NWY3NjgyOFk5YmI2Q3VvaU9EOU1zcjRGUDBMQlNwUUM2RTdxV3JyanZYUXRn?=
 =?utf-8?B?bkFjN21hV0ZEb3lUbWovZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60344296-ffce-4c43-3cda-08d94df6accb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 16:26:51.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quBir48/wYVjVhR13qT3618wt/Azw0rnuJmxDbyacubM7SpFmSuIeKS8yI/tAmEtuN3r+tYjJ/VTD4knLq/L/XXbTKV9zKuGnUhaYeWHVGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1454
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10054
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107230099
X-Proofpoint-GUID: iJ6CRnTDdMUwsh-6oLVyZRUYPoyJDXZa
X-Proofpoint-ORIG-GUID: iJ6CRnTDdMUwsh-6oLVyZRUYPoyJDXZa
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor,
Pending your responses to a few questions, I have v6 ready to go.
Thanks,
eric

On 7/20/21 9:57 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:11 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> =============================
>> I believe I have corrected for all feedback on v4, but with
>> responses to certain feedback below.
>>
>> In patch 1/6, Igor asks:
>> "you are adding empty template files here
>> but the later matching bios-tables-test is nowhere to be found
>> Was testcase lost somewhere along the way?
>>
>> also it seems you add ERST only to pc/q35,
>> so why tests/data/acpi/microvm/ERST is here?"
>>
>> I did miss setting up microvm. That has been corrected.
>>
>> As for the question about lost test cases, if you are referring
>> to the new binary blobs for pc,q35, those were in patch
>> 6/6. There is a qtest in patch 5/6. If I don't understand the
>> question, please indicate as such.
> 
> All I see in this series is
>   [PATCH v5 09/10] ACPI ERST: qtest for ERST
> which is not related to bios-tables-test and blobs whatsoever.
> 
> Blobs are for use with bios-tables-test and I'm referring to
> missing test case in bios-tables-test.c
> 
>>
>>
>> In patch 3/6, Igor asks:
>> "Also spec (ERST) is rather (maybe intentionally) vague on specifics,
>> so it would be better that before a patch that implements hw part
>> were a doc patch describing concrete implementation. As model
>> you can use docs/specs/acpi_hest_ghes.rst or other docs/specs/acpi_* files.
>> I'd start posting/discussing that spec within these thread
>> to avoid spamming list until doc is settled up."
>>
>> I'm thinking that this cover letter is the bulk of the spec? But as
>> you say, to avoid spamming the group, we can use this thread to make
>> suggested changes to this cover letter which I will then convert
>> into a spec, for v6.
>>
>>
>> In patch 3/6, in many places Igor mentions utilizing the hostmem
>> mapped directly in the guest in order to avoid need-less copying.
>>
>> It is true that the ERST has an "NVRAM" mode that would allow for
>> all the simplifications Igor points out, however, Linux does not
>> support this mode. This mode puts the burden of managing the NVRAM
>> space on the OS. So this implementation, like BIOS, is the non-NVRAM
>> mode.
> see per patch comments where copying is not necessary regardless of
> the implemented mode.
> 
> 
>> I did go ahead and separate the registers from the exchange buffer,
>> which would facilitate the support of NVRAM mode.
>>
>>   linux/drivers/acpi/apei/erst.c:
>>   /* NVRAM ERST Error Log Address Range is not supported yet */
>>   static void pr_unimpl_nvram(void)
>>   {
>>      if (printk_ratelimit())
>>          pr_warn("NVRAM ERST Log Address Range not implemented yet.\n");
>>   }
>>
>>   static int __erst_write_to_nvram(const struct cper_record_header *record)
>>   {
>>      /* do not print message, because printk is not safe for NMI */
>>      return -ENOSYS;
>>   }
>>
>>   static int __erst_read_to_erange_from_nvram(u64 record_id, u64 *offset)
>>   {
>>      pr_unimpl_nvram();
>>      return -ENOSYS;
>>   }
>>
>>   static int __erst_clear_from_nvram(u64 record_id)
>>   {
>>      pr_unimpl_nvram();
>>      return -ENOSYS;
>>   }
>>
>> =============================
> PS:
> it's inconvenient when you copy questions/parts of unfinished discussion
> from previous revision with a little context.
> Usually discussion should continue in the original thread and
> once some sort of consensus is reached new series based on it
> is posted. Above blob shouldn't be here. (You can look at how others
> handle multiple revisions)
> 
> The way you do it now, makes reviewer to repeat job done earlier
> to point to the the same issues, so it wastes your and reviewer's time.
> So please finish discussions in threads they started at and then post
> new revision.
> 
>> This patchset introduces support for the ACPI Error Record
>> Serialization Table, ERST.
>>
>> For background and implementation information, please see
>> docs/specs/acpi_erst.txt, which is patch 2/10.
>>
>> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>
>> ---
>> v5: 30jun2021
>>   - Create docs/specs/acpi_erst.txt, per Igor
>>   - Separate PCI BARs for registers and memory, per Igor
>>   - Convert debugging to use trace infrastructure, per Igor
>>   - Various other fixups, per Igor
>>
>> v4: 11jun2021
>>   - Converted to a PCI device, per Igor.
>>   - Updated qtest.
>>   - Rearranged patches, per Igor.
>>
>> v3: 28may2021
>>   - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>>     internal array with explicit file operations, per Igor.
>>   - Changed the way the qdev and base address are handled, allowing
>>     ERST to be disabled at run-time. Also aligns better with other
>>     existing code.
>>
>> v2: 8feb2021
>>   - Added qtest/smoke test per Paolo Bonzini
>>   - Split patch into smaller chunks, per Igor Mammedov
>>   - Did away with use of ACPI packed structures, per Igor Mammedov
>>
>> v1: 26oct2020
>>   - initial post
>>
>> ---
>>
>> Eric DeVolder (10):
>>    ACPI ERST: bios-tables-test.c steps 1 and 2
>>    ACPI ERST: specification for ERST support
>>    ACPI ERST: PCI device_id for ERST
>>    ACPI ERST: header file for ERST
>>    ACPI ERST: support for ACPI ERST feature
>>    ACPI ERST: build the ACPI ERST table
>>    ACPI ERST: trace support
>>    ACPI ERST: create ACPI ERST table for pc/x86 machines.
>>    ACPI ERST: qtest for ERST
>>    ACPI ERST: step 6 of bios-tables-test.c
>>
>>   docs/specs/acpi_erst.txt     | 152 +++++++
>>   hw/acpi/erst.c               | 918 +++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build          |   1 +
>>   hw/acpi/trace-events         |  14 +
>>   hw/i386/acpi-build.c         |   9 +
>>   hw/i386/acpi-microvm.c       |   9 +
>>   include/hw/acpi/erst.h       |  84 ++++
>>   include/hw/pci/pci.h         |   1 +
>>   tests/data/acpi/microvm/ERST | Bin 0 -> 976 bytes
>>   tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>>   tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>>   tests/qtest/erst-test.c      | 129 ++++++
>>   tests/qtest/meson.build      |   2 +
>>   13 files changed, 1319 insertions(+)
>>   create mode 100644 docs/specs/acpi_erst.txt
>>   create mode 100644 hw/acpi/erst.c
>>   create mode 100644 include/hw/acpi/erst.h
>>   create mode 100644 tests/data/acpi/microvm/ERST
>>   create mode 100644 tests/data/acpi/pc/ERST
>>   create mode 100644 tests/data/acpi/q35/ERST
>>   create mode 100644 tests/qtest/erst-test.c
>>
> 

