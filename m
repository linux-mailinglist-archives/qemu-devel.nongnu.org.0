Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A73C5FCA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:51:45 +0200 (CEST)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yDg-000751-Uc
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m2y9s-0003IE-4H
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:47:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m2y9p-0007C7-TU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:47:47 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CFZ4b8064379
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7VFDktzxaBNE+qEmAtwJm+dUStvzJ//Y3rkVVWTlIic=;
 b=X/nu+FpGVG29veifibjJ1Cb7jWqtxXfT4UVkWbp++iaY5HIecEEnjn/EsoknM47ZfIj8
 pefYSCnxZYUWybsiUSFvHyOZuL5cIGGQ0uovgx/3RbQCDaozCfSNzUl+rBa0QcdB9zj4
 +qA/fRya/RtoYDCFXG+OZNHaIyLP0CE6rbDg5BYlxvnD9Ly1Qvh/QorVHdDQbxp5Pdmx
 fH7Ge+k4rWR/W08ID5V8ShG6aCF2MbVFMopCS8glmGZgq7l/O7LJCn2cwc9X1Nj5Tbll
 v+lhr3N3HnYoqIKL+JOL/EDiAwEmFApcMpUfBHhIZ015oX8hqHNfPBNJtxQQyAkuqEQt Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrhyxq8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:47:43 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CFZWbY071791
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:47:43 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrhyxq87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 11:47:43 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CFgLJl023176;
 Mon, 12 Jul 2021 15:47:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 39q36a8793-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 15:47:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CFlfBl36307276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 15:47:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5193112064;
 Mon, 12 Jul 2021 15:47:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9124D112061;
 Mon, 12 Jul 2021 15:47:41 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 15:47:41 +0000 (GMT)
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
Date: Mon, 12 Jul 2021 11:47:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JK55ful4E7F3OzRlmz3oicrCklrTEiY7
X-Proofpoint-GUID: SW63TqXyAntlRye4NnXiH3IbvUApzYAU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120120
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/12/21 11:29 AM, Philippe Mathieu-Daudé wrote:
> Hi Stefan,
>
> On 7/12/21 5:09 PM, Stefan Berger wrote:
>> This series of patches adds test case for TPM 1.2 ACPI tables.
>>
>>    Stefan
>>
>> v3:
>>    - Define enum TPMVersion for when CONFIG_TPM is not defined
>>      affected patches 2 and 6
> I think in 11fb99e6f48..e542b71805d we missed an extra patch
> for qtests. Probably (untested):

Shouldn't we have seen test compilation errors already?

I didn't go down this route for the build system (as you show below) 
because in this series we are testing ACPI tables and I introduce the 
reference to enum TPMVersion here, which wasn't needed before. The 
alternative may be to go into 8/9 and eliminate all TPM code if 
CONFIG_TPM is not set. The introduction of the enum now passes the tests 
with --enable-tpm and --disable-tpm.

Otherwise the BIOS test are skipped due to this here:


static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
                               uint64_t base, enum TPMVersion tpm_version)
{
#ifdef CONFIG_TPM
[...]

#else
     g_test_skip("TPM disabled");
#endif
}

So I didn't want to clutter this code with more #ifdef CONFIG_TPM but 
maybe that would be the right solution.

     Stefan

>
> -- >8 --
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index ee7347b7275..eeaa0d7302b 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -60,10 +60,14 @@
>     (config_all_devices.has_key('CONFIG_USB_UHCI') and
>                       \
>      config_all_devices.has_key('CONFIG_USB_EHCI') ?
> ['usb-hcd-ehci-test'] : []) +            \
>     (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ?
> ['usb-hcd-xhci-test'] : []) +        \
> -  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] :
> []) +                  \
> -  (config_all_devices.has_key('CONFIG_TPM_CRB') ?
> ['tpm-crb-swtpm-test'] : []) +            \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test']
> : []) +              \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ?
> ['tpm-tis-swtpm-test'] : []) +        \
> +  (config_host.has_key('CONFIG_TPM') and \
> +   config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] :
> []) +                  \
> +  (config_host.has_key('CONFIG_TPM') and \
> +   config_all_devices.has_key('CONFIG_TPM_CRB') ?
> ['tpm-crb-swtpm-test'] : []) +            \
> +  (config_host.has_key('CONFIG_TPM') and \
> +   config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test']
> : []) +              \
> +  (config_host.has_key('CONFIG_TPM') and \
> +   config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ?
> ['tpm-tis-swtpm-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test']
> : []) +              \
>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ?
> ['fuzz-e1000e-test'] : []) +   \
>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] :
> []) +                 \
> ---
>
> Cc'ing Paolo/Thomas because there surely exists a clever way to do it...
>

