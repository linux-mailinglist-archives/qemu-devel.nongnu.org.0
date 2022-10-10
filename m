Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6795F9D41
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 13:03:36 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqZL-0001WR-NL
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 07:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ohqUp-0005xi-Lr
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:58:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:12229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ohqUn-0001kw-2Z
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665399533; x=1696935533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B1DEup8EpcWamWD05nmm6UzDMLJEU7Rqyzc27YpqcXU=;
 b=XCXMljApejPsgu0VGi4lsqgIsY1A168ZRH7XQuOaitj8cvntjWs8djDr
 CxNLt47PKlgL5orqSRW4efB2fM6Xl9h1ApBtEj9qN+mDy6gmyDWayo1cM
 ygEHVQpc3Kz4qHVodlfTVmnNAVYk520tLCVmQQcF7ibTt/SpXEsncZFex
 v9y2PbUxxRSDs/wcPT8H25lW8IAoT5cSGFOvQUmF8cShikztt1NJUZ1UZ
 gkTF0o5ia8iRmWR0tPnWk08dwhYjwSonw8pVU+kFge3xWdE41T9POh8hS
 cYBEx8H7THmZNrrMhwDnToN1tjzgZNdDwHvP61jE86pI/w8gZmfu5TcaA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="304185210"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="304185210"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 03:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="628239831"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628239831"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 10 Oct 2022 03:58:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 03:58:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 03:58:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 03:58:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 03:58:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLLO9LdHURbaTD9XLvftOKohvPjTHPnyjKCn/oJQpAbnW4V3voP3ZoWUVfpJEVGSQIuxisD+o4qHaWGwqJM1yCP6+wEW3JDPjNPXBrfmsZ2Nx2g5PJ8jOuMklHLa3XQ8SD1d9kVH5Dy1zIdLWs35bVVExeCz7upj+K6RpuL46pQlttyJU6Iw6ZyIQrhBUlkavWC1HgNG0x239raYVaGj3fAgECkrg3q9wSOaZ80cOYn7wpx9xaIIE9GGmCL+uKb4A1AaJKihqfwmiSoT8UoN8UDw8HLlLH3gU3JImSeRrkiQatwckVpTgXoN0YbXHF4Edwsk1Lv2e7LSF2XcGLyz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCsB8JpvU3c9mgPwwYdfP1YHjpeJMgRmWMAzUMY4pvY=;
 b=f9WP5YnXKKyxYNRkn/LTd/bwlFro2KI19HQKdIH4G19Pvzl5PU4F71AEZURtdeRwu+R0JRLnLhO+FjUxVc/7aNclbhAq2fqVBi1KjCy2yGDxFyx6Iun9BRgdnk/Rd9WVm8XJxqg/+gkpsM04c7ZmM8FMha6SZj0i819IDRNW9h44oFDmh9R6Sy4J9VkHK050AA79BvgARjkkZrYQozIn/kiXY3z+bee6IGXP0U+5CWTMGniZZFb/UOgbmmrvuiQwnWb2HeAKLOR0URKi/QDl18iotFCGzSgnLf0yIvssm+faB/FMjTjwHz4jDlyP3Xgqa571i/j70ZYFPIH7ijyz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by SA1PR11MB5801.namprd11.prod.outlook.com
 (2603:10b6:806:23d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 10:58:47 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::b173:e9a1:a680:4740]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::b173:e9a1:a680:4740%12]) with mapi id 15.20.5709.015; Mon, 10 Oct
 2022 10:58:47 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>
Subject: RE: [PATCH] migration: Fix the minus value for compressed_size
Thread-Topic: [PATCH] migration: Fix the minus value for compressed_size
Thread-Index: AQHY3Iy9UsZn1OAvjUuj2ocnrHs/Wq4HbsiAgAAEN5A=
Date: Mon, 10 Oct 2022 10:58:47 +0000
Message-ID: <MWHPR1101MB21106651531F1096F438D56292209@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20221010093415.2779165-1-zhenzhong.duan@intel.com>
 <Y0P1UV3UxZGvBADu@work-vm>
In-Reply-To: <Y0P1UV3UxZGvBADu@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR1101MB2110:EE_|SA1PR11MB5801:EE_
x-ms-office365-filtering-correlation-id: be38c944-e592-45d2-05d6-08daaaae682f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 32HfsntvQeYLJBCX+6ibmHB7iVQVXLUOoTaU2/OY6Pz5jaX4VZv4ENh/T5BXa2Z49I+4qML29hk5Qo1OGfZNbWfST5ks67kNQAeShgg/DuUEgdoBT5Avg86X7NnjZGmCTIbUUHy916djFNH0ZjzKOxFh3a/fFYp24ULP2TQw9a7GVgH+huwn7HAehPmJadwpbu0BmxN7EaK4k3ZSSsTVy8BLSdjQCwcMKG7tfZs+xgOgJDK+Q0qKLVgOOf1Fh2ZHtxqI+39vW7w8v7WqQPrxtsUB4/97M+CbAkNCumgArEVG08nlNA5A35c9MvsRpzhjn5L4xm12KDsBqyYFh1q0HoYpVTi6UYx75WKa0Ie8Fxrie1Tne1uWf66OWn6FRvo2+WfAe+PF7GwK1RX/k2uHl/zeCo2acojtdaUxA5nYmpJgIiNkvtw07ou6zGSJ/zTta1vieMiB+is61aGmJrKfg+11zgbEDiwqZev9XlxFLO8jWvDEDOQT9WOzoPrULJYbBTWuRohVbUj0wgq19sjXT4hmM4pX58GQVo5q2ErnzVAA2vLr1IlyFLUZm2zDey2buGYPog5ZiozIWY8Jzly1SnAgJJl9pebHX8zV1LcyVQPBp4soN8zHkLtIKOvOwJADjKzWhHj3P45q/ijFv/fmK/nN5Qj2vhd3McCMmo6ESFmwkManA4/KZI6EV+WkEpsWIAUzsY94s83pAxghB2MdvESPF6geEjRIGS8rYLUK+7QP9OVUK/czFGdDvNmzNvPUDMAT2FgqveVNs6brH1qozg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(6916009)(54906003)(33656002)(86362001)(8936002)(122000001)(38100700002)(82960400001)(5660300002)(55016003)(38070700005)(186003)(66476007)(83380400001)(64756008)(26005)(71200400001)(7696005)(478600001)(8676002)(66946007)(6506007)(66446008)(66556008)(316002)(9686003)(2906002)(41300700001)(4326008)(52536014)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7vsNhLc5wkUh7+s7HVoRUxxiWJwGgmFH2hLHVk51ryqVf3R75eyoTkVbUxLD?=
 =?us-ascii?Q?HaM9WEKJHB4hO/TdtlrJQui4JXc63OAhzRqghQQBsV4lMvI6F5BoATWmXUCe?=
 =?us-ascii?Q?dJpgjQdsCnBe6GOmRkRdiguPUpo+ZIfhs9ziXctzOWe5ITOG0KhsWCXGud1h?=
 =?us-ascii?Q?/tQLhsErqFLpDLCYNfD/V6mxrl2uQ27ADT2+IAqPdinUBeWzMARRXIetRizg?=
 =?us-ascii?Q?69lVOkqnFTZqB6k0AfxGQ8x660PVtOOo9I5y2Z+HBeqanhrJCRWRdmbR1ZlI?=
 =?us-ascii?Q?ObkZy5de0s0NY//0p0GLmgXQAtX+sviLPCdAMItVP3BWOAFRXjrokuoBPlNZ?=
 =?us-ascii?Q?dNX1mmHh80QXq4kZJxInje3Zj/lq4iLk+4zV4lETrWeloLzET/cTMvr7+XU8?=
 =?us-ascii?Q?GPK6A0tweJkxxdjrZ8mnU8gFk7AH4814ZzRMMNt7JVoARIDyZdWKqrTyR+h3?=
 =?us-ascii?Q?sjRhT4riNQfdo5E3A4jKz7jXlarmRzZw/TwU3Aa7xlNseXFgLHpk+kghv6a0?=
 =?us-ascii?Q?UjSZ72ehNot4J4ZvpKcn9UsLMdxWqffAE7wlQB7ZeWCIAdEmKVpuaESwPsFa?=
 =?us-ascii?Q?fKkUltjS3z1faxC79xtbRm2zy58Lduqf6hIVVJagr2S94AjsIc6UWWEhJgzk?=
 =?us-ascii?Q?GAX/HUkUjFHnOiYfwPtfCOoehqWkvaMJxdD6o6h5aFHBQUayv87dT9NeoanK?=
 =?us-ascii?Q?8RRupN8d9jNGdOCiGJ6iU6QGNrqcUGPszLxFnqIuT0v6uZNnq6/V1nDNZDga?=
 =?us-ascii?Q?eVTaN1WmdewHJB0/lvmWPzUP4DL/Vw1QhuqzfrNbKSDO/0iZ2k8UB4lj2arV?=
 =?us-ascii?Q?RROdjohcjy2SjIc++4SPrAOU+g/C/OJc/xBsifvidHmTIpZKju1zOW1WZX9o?=
 =?us-ascii?Q?txGpMq8CDakGWofYtkit2XhHSMN/Q+RUCaQreZ9KpXL2EtNy+0p0rLRMA0B1?=
 =?us-ascii?Q?vGAEODOu2RZxpKmc9/9TxiPjIx/0YSnxLsVDmnPwfnFr0/Ww4ffYCYBBPpRw?=
 =?us-ascii?Q?hqQOPaSn1Jo/CIm2/AVyO21C/dRhjZWqj8DkB+CHvETpIDSWi/+1f0j+NC+o?=
 =?us-ascii?Q?AUTVyIBO+2I1EPGwPX9PnPrlexB6V3Tc8qIlZUhy/lf5x2mq2LsljzUQ4YwY?=
 =?us-ascii?Q?8DwtpomG+JZmghTM1CEuZFyzCwQU7vWAE5ZIkfEVitGBsxsmREmOR187Kx5w?=
 =?us-ascii?Q?odctMzf/NV8jZ6dyXgn1CSnsiRNaEdneLk2derE4A1MNdoL2bAHeyyg0w2UY?=
 =?us-ascii?Q?BYVoMalC3U5XVFYBg74ad6pJ9BLhEvzTmRIxrghYBOOJuUqCAF9WJySEhSi2?=
 =?us-ascii?Q?AUvqXQkQ44xAyeOsBXkDdLhf62e8E4RMNQZNgOzk9Z6SqB2JbxAOhIFHpi5f?=
 =?us-ascii?Q?gYigi2uQNVrHuiLZOywphDCEcY/Z8OvibPTsmwT520oobdWpOKOZaRcYjbyn?=
 =?us-ascii?Q?KHkN4uwEJzLbi3b8rUcyQrF/QMcUdEvdJAcEvoNB2neJdCt4z6myNx8N7Kyr?=
 =?us-ascii?Q?5dQ9rH2OpcQH9BoDmEXE+xFihoA/jZ9aeLcxfOcqZKjYZfibIjJY3apDPIXW?=
 =?us-ascii?Q?F48NYY3pmZIDFksCypmPsr2uudFSII7LE6Fo3jHX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be38c944-e592-45d2-05d6-08daaaae682f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 10:58:47.5133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFv8ZeghtP5HuwC+iqZCqxrYElGF+yKufZVSxtDaCHHAsF+uQZuU0UN9/wKT3cB/6ftyRgbRKIQ5kXMEi+d88lKdxroxffZV/1PLn3kcsL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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



>-----Original Message-----
>From: Dr. David Alan Gilbert <dgilbert@redhat.com>
>Sent: Monday, October 10, 2022 6:35 PM
>To: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Cc: qemu-devel@nongnu.org; quintela@redhat.com
>Subject: Re: [PATCH] migration: Fix the minus value for compressed_size
>
>* Zhenzhong Duan (zhenzhong.duan@intel.com) wrote:
>> When update_compress_thread_counts() is called first time, there is no
>> data stream yet. We see compression_counters.compressed_size
>> becomes minus value shortly.
>>
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> ---
>>  migration/ram.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/migration/ram.c b/migration/ram.c index
>> dc1de9ddbc68..510db95cdc36 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1443,6 +1443,10 @@ static bool do_compress_ram_page(QEMUFile *f,
>> z_stream *stream, RAMBlock *block,  static void
>> update_compress_thread_counts(const CompressParam *param, int
>> bytes_xmit)  {
>> +    if (bytes_xmit <=3D 0) {
>> +        return;
>> +    }
>
>What's the call path where that happens? The only place I see bytes_xmit
>being less than 0 is in compress_page_with_multi_thread where it's initial=
ised
>to -1 - but it's always updated before the call to
>update_compress_thread_counts.
>
>I wonder if the real problem is:
>
>    compression_counters.compressed_size +=3D bytes_xmit - 8;
>
>Is bytes_xmit being less than 8 for some reason?

bytes_xmit is 0 when update_compress_thread_counts() is called first time a=
s comp_param[idx].file
is empty, which makes compression_counters.compressed_size=3D-8

(gdb) bt
#0  update_compress_thread_counts (param=3D0x7ffe340011d0, bytes_xmit=3D0) =
at ../migration/ram.c:1446
#1  0x0000555555cbf480 in flush_compressed_data (rs=3D0x7ffe34259d40) at ..=
/migration/ram.c:1486
#2  0x0000555555cc0a53 in save_compress_page (rs=3D0x7ffe34259d40, block=3D=
0x555556aab280, offset=3D0) at ../migration/ram.c:2260
#3  0x0000555555cc0b0e in ram_save_target_page (rs=3D0x7ffe34259d40, pss=3D=
0x7ffece7fb800) at ../migration/ram.c:2290
#4  0x0000555555cc0fd8 in ram_save_host_page (rs=3D0x7ffe34259d40, pss=3D0x=
7ffece7fb800) at ../migration/ram.c:2487
#5  0x0000555555cc11ce in ram_find_and_save_block (rs=3D0x7ffe34259d40) at =
../migration/ram.c:2576
#6  0x0000555555cc2863 in ram_save_iterate (f=3D0x555556a98b30, opaque=3D0x=
5555567c92e0 <ram_state>) at ../migration/ram.c:3304
#7  0x0000555555ae86bd in qemu_savevm_state_iterate (f=3D0x555556a98b30, po=
stcopy=3Dfalse) at ../migration/savevm.c:1261
#8  0x0000555555ad7500 in migration_iteration_run (s=3D0x555556ad5390) at .=
./migration/migration.c:3757
#9  0x0000555555ad7abb in migration_thread (opaque=3D0x555556ad5390) at ../=
migration/migration.c:3988
#10 0x0000555555f20012 in qemu_thread_start (args=3D0x555556862180) at ../u=
til/qemu-thread-posix.c:504
#11 0x00007ffff78f5609 in start_thread (arg=3D<optimized out>) at pthread_c=
reate.c:477
#12 0x00007ffff781a163 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:95
(gdb) n
(gdb) n
(gdb) p compression_counters
$6 =3D {pages =3D 0, busy =3D 0, busy_rate =3D 0, compressed_size =3D -8, c=
ompression_rate =3D 0}

Thanks
Zhenzhong

