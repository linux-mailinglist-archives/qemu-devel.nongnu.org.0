Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E54D9365
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 05:38:05 +0100 (CET)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTywd-0000un-J0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 00:38:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nTyvj-0000DY-T3
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 00:37:07 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nTyvh-00072V-CT
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 00:37:07 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EJ1okI020675;
 Mon, 14 Mar 2022 21:37:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ZBeUWiMjAdfyI2xHcXIGBCHu+bOWBMWMI4whQTwR2Bc=;
 b=kf9QAvkg8QL4lLfUvnkkkW7zbm+LKRG2lt65sgE/eGYGO7Z3w/RcmIZKAfO6CnrKOlwo
 Bs1ja7j0GxYzklth8XtMMKev+vgR+HAgBlkhM1RNUtw93Q+wzJhJSrXtblC2JSPfaoi/
 +qBEQ6NFeUvYWyypPwe8sqPfqzU3NC2XdFolWMLU8NiAVJUZE1G0mUKI6dAdGDVduYL8
 7q3jdXQe8gw0PwByZP1YoJWWQq56PtJd4Bw+HUHGIWQekg5dgi+WWJzSd+BAFnsnmGSH
 rxGMZiM9un/QR4LtXs+itdD4siPEXZ45KMmmEN08/SkLdZcZoboXxwqnKLRkEK2k5gST tQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3et64m1n63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 21:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnB+fKIGR/UGsrO0s016hSTBhG4Orvegbdl+EpWwdM6q3KoeQReQnOQ5p18MOhXyeCuxBecLdEebv3+02R7YaxhaeSvYeJPivIPC2e5f7tD5Can/PRcpgA0bYVZ7BWbJ327MxBMskOz0nA3qqEnhHI6Rj5wYgiF0M47ZH29QkREl49IXDIrLHE7lO+riHce/cOixKirdoI2z1//HUh3na64TqOoWHJLTna4F3hRkZOzKVkNANU6YOHLxoQxAP/2SHuAx+72J1k14SuxbqWcRd2T0rQZ82TmKauN1XfxfDoqiS0Vpl/vA9FUTaGaI9u+Os1ccIu4CeughK5JQgmix3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBeUWiMjAdfyI2xHcXIGBCHu+bOWBMWMI4whQTwR2Bc=;
 b=em9QP+s4VxPl3g5uwtcv1RyStt9y0tFhbPcfkO4WQKoRocWi8vjtZBxo8kz9s6mc7jy8aq7sizuuimf9sdMawi9HgbrLh1gy4AFgXE18EWL4sHLCc+qIc5Pi/4ilP+zfWM94BXACkvIc3URmDHPOpoEV8Toax97N0haZlG9T+Q4RQnmQ9WfJ3kJNjTu9n0adxhUBuY+wOFp54V7pwQUERYjRTPUS62rHzgzBrLd4x/AXLuDg/B3m1jZRbN/SydtKRG/781tJQKuZzAv4T+lhswgI1FYr596JEj5xERhtl0is+VSiObrMUkxw6Miy5ZvgUqNws8dxVVhuFiQtOvnrUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by MWHPR02MB2336.namprd02.prod.outlook.com (2603:10b6:300:5d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Tue, 15 Mar
 2022 04:36:57 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 04:36:57 +0000
Message-ID: <30e38de3-3b07-b440-ad32-a189720db301@nutanix.com>
Date: Tue, 15 Mar 2022 10:06:46 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG.
To: Markus Armbruster <armbru@redhat.com>
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
 <871qz88yu7.fsf@pond.sub.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <871qz88yu7.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:a03:80::16) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20bf51f0-7450-4e70-78e0-08da063d7018
X-MS-TrafficTypeDiagnostic: MWHPR02MB2336:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB2336C9D20BA9F21A4D34CBF599109@MWHPR02MB2336.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hVYvHr4EJTvPphENYDvZ3DYCIQF436VV0q0HPikJ4qAdQWgUQFAAwZT4PflJSufxQbOkhz1d6mWiHM5HaS4Q364mNUbZAoTNUCRYjeMDe7oeU52NhKn6uCYP/h9XQUr8LJ1mDcANslQcOUHQvJIEFy/09M7b6GT3bPpIEwMUHKgCCfl+2L6IXidAOLbkp+/KWtQZSXuMZ2kuylFErM1C+Vbd6UrS9BplSVNzAhJKy26VNQIMDzLCDAgjVWfjAugu1HHEvAo4fuT1JQwy3ACTWq1adUcuDElgQyCO++uk/l77Jd7R6kmWT4MO2Fbk73mchwbzlYnsD/yLxvlX6HS7Ladn7ayts3q5vSSNe69quueivJZRBGTpRLA5jaVsBEJacVW+1EfT/ffh9QSJNocJPpPOC+xgJKNNjWP84+WD24Bv1KggVRwfbJ4IxTKSM6S6bqg3VyFYkrFYIWnLH5pttYMEH58Mt+1D1MEbZhksiSsOBYNTH0T45RAQY/JZL7RJl+BX/v136cd32xIOrLnn4dEqAuFU3kgY1QtHhev/ZiI1OcO4D4Fo5sUCol1Xry+61JkW7qVpemfTDLtTjAE5TDWgGCJ4ZS+Tk/7U8oZuAXD+TI54oOvFSnRihL/qZT6xFJlUd88amDccHUXcFDFJH2R83iMt+LdjzlM+QQTABOeB1xE6bto1wjihQJQzk7k85qhAyPNzqvks+5EG0CSlLDjAC6g7KmxVh1bYbs3zJA/OVbJ0mKibPdqpRNCliLRI11+ndUdr51BWDd4HLl5kWT64QYccMqPClEMGCS6LvvKBFbcq0f4CFJ3sM+pt/hiMmSC6BDZlv1eKYDSRo/rXBTu03QGFblib6DAUCFnJLDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(2616005)(107886003)(966005)(6512007)(86362001)(6666004)(66574015)(2906002)(31696002)(53546011)(38350700002)(6486002)(6506007)(52116002)(38100700002)(508600001)(66476007)(36756003)(4326008)(8676002)(5660300002)(66556008)(66946007)(31686004)(44832011)(8936002)(83380400001)(6916009)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU15QzR4NXZjUFNQNVhhMG95cXEweWRxakNBMS9jTXo1MEtEVlZwTWlkRUkv?=
 =?utf-8?B?SjgwWTJMR2UybnhsUkwyZmoxMWoxL0ZuaUorQTNJeThDUVZsaWhTNkk2aDNm?=
 =?utf-8?B?ckdEYmd3Zm9UeldsUlpId2R5K3FUeHNEZDM2V3RDdGMveGkxN2l0TDJ5ZUlj?=
 =?utf-8?B?NVh2d25hbFZqVVExRkJrTlpQMTVwOGdtL3hRcG93ejU3L3VQMTY1VEJzQ3Nv?=
 =?utf-8?B?anBlNjRWanVHQjZXbHRNNmdwSDNsWjlvcTJ4RlhxY05qRmpMRlByZ2NCa1Nz?=
 =?utf-8?B?cFkxMmx6VWh1MHB3NGJkQ0QvZmlLSXFpaUY2SVpWamZXY2ZBOVB2VmltZU91?=
 =?utf-8?B?VnUreTZNcXJ5UlVxTk1MRHVtUnNIOFdlMmVKU081dlNSTFRLK1d3ejVGZjVH?=
 =?utf-8?B?T3ZNZk1rdVVyOER0ZDJ1aWFEWXdxV1M4Vm5vTlhRN0JUVkEzeTdzZzlLVDdw?=
 =?utf-8?B?UUo5YmVoblRiUnJ0QXdiblV0WmNHWUVzU3VHbTA1OGdIbi9Ybnh4VklWRWRO?=
 =?utf-8?B?R1B0ajVmcExtM2ZwZEREKzVnMWdrUE5FeFNSQTljcDFDWGZjVWVlck0wakM3?=
 =?utf-8?B?QzFRY29XNEhaa1Q4aHpiSzJBSElWRThmemhvUGV6ckJOMC9mQ2FpM05Tcjhi?=
 =?utf-8?B?eXZTZXJTOUk1WlZsMkRTQzFQT2FqbS9KRjFsTENydTgrQVlYN3JjaXd5UDNL?=
 =?utf-8?B?UDZLNUZibnVxQ0F0bzJYYWgwSTFPQjY3SzFzREF0RElXUWhrL3hLeFNuT0Nn?=
 =?utf-8?B?WCtrSXdqUW56ejg4eHZuaG0wREI3a1lJRmRoSDBGeU1WSFFEUVB4VGwxWXJJ?=
 =?utf-8?B?SHpQWE91NXdGMWNPcHB5a2IvYm1QMkwzTld0UG14dVdVb0h4ZlgwNVJ0N3lI?=
 =?utf-8?B?a25DWjM4UHRzb1ZqUGlkNlltSnJKdlR3MjZyekhlZ3NRbTZqdVBwdVVCNlRO?=
 =?utf-8?B?d3BMNWY4WGFUWm1YYlcwRlpPU0RqV1hScWFIakZIWnZtd2FZNXp0TTJEZG8x?=
 =?utf-8?B?NEJjVmZ4eVFlWFJRYk94dnltSWkzVTYrcVA4NnBIbFU4N1FPSnI4bG94S1dh?=
 =?utf-8?B?VXNzaVM1ZXN5MDdSR0p4N3U1SGZiaFBDbTdzMDBydHQwZEFFVzhWL2psc1pp?=
 =?utf-8?B?NFBET1JKRTJiMlM4VXl0enFRRnUzQjA1ODFhell4eDhJMjZSZVZNQ0pHSmox?=
 =?utf-8?B?VHptbmNvV3VOMlBsMDhZUGV6SG5IamF5TWRFUGdIaUkxQ0JRTXhNZnNZRWlt?=
 =?utf-8?B?VUI4TU9sU2ErUGcxQ1ErWTdFMkhxNUFPTitScUNNdGZCTHdIM29GY0lOSFR1?=
 =?utf-8?B?RU1zTm9CTVZPcVZtYTByNnVuYXJ6L1pwQ1NIWFB5SUx4OXFPWkw1Q1VSQlhu?=
 =?utf-8?B?Vkd5enE2ZGVxczR0V1ViM1FTd0k2S0FEcytZbXJDdHpSSHZWbVlDZDRqY3hq?=
 =?utf-8?B?ZUpoWUJnWUtBb3gyVGM2a0hDOEo2RUdxL1hjMTRObDhyOHpNSXhKR21EVHBi?=
 =?utf-8?B?TkQ3ekV6RXV0c0tzcUYvUmlOTzlpTlpuYmViSlRNdDh1NE5jL0tNSmJnQWx1?=
 =?utf-8?B?TVRMUzBlVmltS3EzS1ZvaGl5WVBmQW5PU3RYNlcvSXlTK1kyQ3RQaCt5QkZo?=
 =?utf-8?B?alpaSlB3eXJVVkJzbHJZamtNWnFNRXBOWDF6eTFSWUFxaXNTMGE1OW5nTFJn?=
 =?utf-8?B?UlVhRmVoanlML0V4VDdPL1pQdGxIeGFmS2hibGw1UWJJcEhJSjdndGRpZDJ1?=
 =?utf-8?B?bXNIaGt3VTRNanI1bVpITUNJeUhSRXJqSm9rc3Vaa0M4YnVDR3RsWnZUZEdp?=
 =?utf-8?B?STY5QTBpd1ByZnh5aU94aWZldjhTNDBMN3dFS25iUkVGRmtuL3JhdW9xOG9F?=
 =?utf-8?B?dm1DSEJVNGN5L1hIeUpwN25CZ0I5MWtyQXpQU29VVHF4WXh3d09XYWt3aGRJ?=
 =?utf-8?B?ck81UFNvYTlFTHpvZW5kckFoTmZ5V2ZvcG5GTnNYWG9rQk1SUjNUb2dqQytM?=
 =?utf-8?B?NGhuR1NDSGlnPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bf51f0-7450-4e70-78e0-08da063d7018
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 04:36:57.1176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +41fCKHwPxhsk98JA3om/EBUD/Ix5J/uLc5/G4C+8CWuYF2p4OpPsXyKdhHb4tykQ/yPcBzbf0L+LODKmk+htf+vV7hsI7aMcYxl3Ciq5IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2336
X-Proofpoint-ORIG-GUID: IMNBCz4L-rzXmLbpI-xc_U_R-Ful6sh2
X-Proofpoint-GUID: IMNBCz4L-rzXmLbpI-xc_U_R-Ful6sh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/03/22 5:50 pm, Markus Armbruster wrote:
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=SxmcA4FlCCy9O9eUaDUiSY37bauF6iJbDRVL--VUyTG5Vze_GFjmJuxgwAVYRjad&s=OIKnm9xXYjeat7TyIJ_-z9EvG2XYXMULNbHe0Bjzyjo&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
> [...]
>
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 8c384dc1b2..9a640146eb 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>       const char *filename = qdict_get_str(qdict, "filename");
>>       const char *id = qdict_get_try_str(qdict, "device");
>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>> +    const char *input_format  = qdict_get_str(qdict, "format");
>>       Error *err = NULL;
>> +    ImageFormat format;
>>   
>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
>> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format, -1, &err);
>> +    if (val < 0) {
>> +        goto end;
>> +    }
>> +
>> +    switch (val) {
>> +    case IMAGE_FORMAT_PNG:
>> +        format = IMAGE_FORMAT_PNG;
>> +        break;
>> +    default:
>> +        format = IMAGE_FORMAT_PPM;
>> +    }
>> +
>> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
>> +                   input_format != NULL, format, &err);
>> +end:
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 9354f4c467..6aa0dd7c1b 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -73,12 +73,27 @@
>>   ##
>>   { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>>   
>> +##
>> +# @ImageFormat:
>> +#
>> +# Available list of supported types.
> This is just a hair better than "Lorem ipsum" :)
>
> Suggest: Supported image format types.
Will add in the updated patch
>
>> +#
>> +# @png: PNG format
>> +#
>> +# @ppm: PPM format
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'enum': 'ImageFormat',
>> +  'data': ['ppm', 'png'] }
>> +
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Write a screenshot of the VGA screen to a file.
> Is "VGA screen" accurate?  Or does this work for other displays, too?

The patch didn't modify any display changes and VGA screen was

previously supported display type.

>
>>   #
>> -# @filename: the path of a new PPM file to store the image
>> +# @filename: the path of a new file to store the image
>>   #
>>   # @device: ID of the display device that should be dumped. If this parameter
>>   #          is missing, the primary display will be used. (Since 2.12)
>> @@ -87,6 +102,9 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. ppm is the set as the
>> +#          default format. (Since 7.0)
> I figure you mean "is set as the default".  Suggest to replace the
> sentence by "(default: ppm)".
Will add in the updated patch.
>
>> +#
>>   # Returns: Nothing on success
>>   #
>>   # Since: 0.14
>> @@ -99,7 +117,8 @@
>>   #
>>   ##
>>   { 'command': 'screendump',
>> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
>> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
>> +           '*format': 'ImageFormat'},
>>     'coroutine': true }
>>   
>>   ##
> [...]
Thank you for your review!

Regards,
Kshitij Suri
>

