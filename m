Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9564D1C1F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:43:28 +0100 (CET)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbzj-0004y9-6t
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:43:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nRbyW-0003qW-QC; Tue, 08 Mar 2022 10:42:12 -0500
Received: from [2a01:111:f400:7e83::61d] (port=50241
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nRbyS-0000aq-V1; Tue, 08 Mar 2022 10:42:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2R++/JO9pstYLdGDn2hwB6Y/0r39LQ1nAUl6THyedwSZKDdRIwXIoKDMJKmjbDZMhUvdNnTG3SIzLyjrMPz7umSDaSeX8bJqS5IXi7LIbzB4Ae0zWr6240S40nx3Haor5OwVm1+mfqodYhe76373hm75cBuXqQa7VqM8IZvsL+ji9qhLVYqi82C75w5BAc3rODS/tMGgV0sNJlWnNys8hD1CwlweqNry1Bu2EhbFPUA5seYlr1abTh2OYGBrSGGuRONfs7TSf7bLdhh5sSZr2URIgw33u010Gop4b6ZXBX7fE2CopBEkjw4e1hkYNI0oQWzrBEN1ONtcT158hiVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kgLXGm7QymNnWu5miKqxOCHGXaNC7IP5edNykiGKxg=;
 b=jM1+1XuRaeSPrZvm1KGOM+DlRW2gHXAG3wmOGUG/w25DIcC/e11RFVxGlQU3n1EOSS7ZAvDGjDrbnSY4UcqlWimd0EqO7zOEznk8l1//VbeRRnYtKJuZMT/jnG0r2hv3COnD4OlDR80e404weWM4kd+KDQuq2HmXElNQycy/R5OnFcR1QQaxkqclffzsj3uy5nC6OgGevxFPTrZCxa+u3924nMt632eMutUGZi8FLtGyw3Ie8zGMJDYFpgXFSYxT080Gyfxfr/z7iZYMuIlv3gy2K6MX5GTCwv+GHiXTrCnfLA+zvj4t2sav5gKsV4X+1CBRMk+PRkeJBnqPw7BzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kgLXGm7QymNnWu5miKqxOCHGXaNC7IP5edNykiGKxg=;
 b=pflP0VHKo+2szFPagL2BJx1U1l4mSAJffYvogc4y8QbREDzINREgNBIepPweFXk1WmlytXUEEjSW3+L9GMPyIe8RHfwuAbvymAv2qvFJ4XQHL2c49rIdOfpwUFx9WXQPfMgOrNo6NioNt4k3QNud6apEKR6Ov6mJGiDfDDJKfrM=
Received: from SN6PR04CA0102.namprd04.prod.outlook.com (2603:10b6:805:f2::43)
 by DM6PR02MB5450.namprd02.prod.outlook.com (2603:10b6:5:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.25; Tue, 8 Mar
 2022 15:09:12 +0000
Received: from SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::1b) by SN6PR04CA0102.outlook.office365.com
 (2603:10b6:805:f2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 15:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0007.mail.protection.outlook.com (10.97.5.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 15:09:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 07:09:01 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 07:09:01 -0800
Received: from [10.23.120.147] (port=63464 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nRbSP-000EZW-4E; Tue, 08 Mar 2022 07:09:01 -0800
Date: Tue, 8 Mar 2022 15:08:59 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
Message-ID: <20220308150857.7fg3og5aefwbufom@debian>
References: <20220308150207.2546272-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220308150207.2546272-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4de8947-b57d-4113-af28-08da01159a21
X-MS-TrafficTypeDiagnostic: DM6PR02MB5450:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5450B5D574A493DFD74ABDABAD099@DM6PR02MB5450.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2RjYu4Snja/Bq0SmI3LEJPAVrr4gyGMaHzE5wv/BC77eRpCE12YNVzJz+Lqw7H//wMhT7akv4G3kbhAKPn4xhj1kT/JRTrbXlRCikBpIgO00rWGXiNzVcM1B++UoP2T+anePr0nDsauEWIe2tD/yerPdvgwvivtJ1l8kRmBImtrK3qRUsexIcs7T+Wgr4+RnZDNe54rUvF7fC/nAl+a8v5rP1DTcwSlZL7c+yao/rlG24oYJsVFUA2IdAY9d4N2ZgeVc/G82R07KRw6P5Q6sKBrYZq84yZOoE6CJNG76XSEQNgcRGKSFRW1oSsoTR0BADxjUbZFIQqdSmOhkgNR3z5H0EwsdRgqHidvvOJSv+fIAfcgAxWHMKvrF4afLNneiJSMqw7WMOfN5RNIUtfmDrPkVAlgynaj1+nfP5JAlypUmT8jdWNgTOQMEdrQn3FyftBkLDJzt0qlLECXHvjaglxcojx9YAadyAppju72QdQWQaU/I7PmjP75/4Wp1oBBLrZXnJGEtnACbuALNgWtZOW7MANiM3g+mP7rxkbC26O/ykA8mwFHci3RFOgB8a2R4Vby/R4IunR925JIM/c7zxFp39Zt1PQJlP3qdr1DWwqz1hLkC4gejVDFhJqJUCnzzR5dhj8cE9IGeOLES18sfMzoVk5L+D1t/DFKoG7I1jr/IKLkxS1OEYXXUuXFhNITd
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(7636003)(356005)(36860700001)(44832011)(33716001)(9686003)(9786002)(83380400001)(426003)(5660300002)(336012)(508600001)(9576002)(82310400004)(54906003)(26005)(8936002)(6916009)(186003)(40460700003)(2906002)(8676002)(47076005)(70206006)(1076003)(316002)(4326008)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:09:11.7405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4de8947-b57d-4113-af28-08da01159a21
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5450
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e83::61d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e83::61d;
 envelope-from=figlesia@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 03:02:07PM +0000, Peter Maydell wrote:
> In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
> own class struct, but forgot to update the TypeInfo::class_size
> accordingly.  This meant that not enough memory was allocated for the
> class struct, and the initialization of xcdc->read in the class init
> function wrote off the end of the memory. Add the missing line.
> 
> Found by running 'check-qtest-aarch64' with a clang
> address-sanitizer build, which complains:
> 
> ==2542634==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61000000ab00 at pc 0x559a20aebc29 bp 0x7fff97df74d0 sp 0x7fff97df74c8
> WRITE of size 8 at 0x61000000ab00 thread T0
>     #0 0x559a20aebc28 in xlnx_csu_dma_class_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../hw/dma/xlnx_csu_dma.c:722:16
>     #1 0x559a21bf297c in type_initialize /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:365:9
>     #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
>     #3 0x7f09bcb641b7 in g_hash_table_foreach (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x401b7)
>     #4 0x559a21bf3c27 in object_class_foreach /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1092:5
>     #5 0x559a21bf3c27 in object_class_get_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1149:5
>     #6 0x559a2081a2fd in select_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:1661:24
>     #7 0x559a2081a2fd in qemu_create_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:2146:35
>     #8 0x559a2081a2fd in qemu_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:3706:5
>     #9 0x559a20720ed5 in main /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/main.c:49:5
>     #10 0x7f09baec00b2 in __libc_start_main /build/glibc-sMfBJT/glibc-2.31/csu/../csu/libc-start.c:308:16
>     #11 0x559a2067673d in _start (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xf4b73d)
> 
> 0x61000000ab00 is located 0 bytes to the right of 192-byte region [0x61000000aa40,0x61000000ab00)
> allocated by thread T0 here:
>     #0 0x559a206eeff2 in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xfc3ff2)
>     #1 0x7f09bcb7bef0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
>     #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
> 
> Fixes: 00f05c02f9e7342f ("hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  hw/dma/xlnx_csu_dma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 84f782fcdc0..60ada3286b4 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -744,6 +744,7 @@ static const TypeInfo xlnx_csu_dma_info = {
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(XlnxCSUDMA),
>      .class_init    = xlnx_csu_dma_class_init,
> +    .class_size    = sizeof(XlnxCSUDMAClass),
>      .instance_init = xlnx_csu_dma_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_STREAM_SINK },
> -- 
> 2.25.1
> 

