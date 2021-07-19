Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A03CEDE5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:51:43 +0200 (CEST)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aEo-0004Jl-3s
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m5a0a-00062o-FG
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:37:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m5a0U-0003yB-SM
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:37:00 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JKWqKT009908
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Myb1vpgkU+/KVPKWI817xsje4PIuMwUWyyyekEicGPs=;
 b=sp6crThqN+83fP7WRliBaU82gOXSYfi73DNOvrp5qRX6n36nmt17Hp84N/VuYIEovzdz
 f4lk94hjBZDgHyd4xYtefQCi5L4Es+agS1p9zpf7JCNp0C51MK3hNcNhHr1vvmsmB5cO
 7R/8Bd1Y+6Hr0Vu6OSe95WL8fN2Fmdh82AUfYbab4KMvlFjXlEWwWYvYOrFr5g+NgIhV
 161o2Sq3uyMwCwBusCwJV2P9Ni2Fhsurvrz1/SEiXOBJsVSfBsVQUna/LLOzJgUZtf9o
 3u/uO7sjaLxIlosh3ninBw6313NKRYYI+2BtjNEFb6G0Zn2zneetBkMS/PUv7Iqluw2L WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wcy5xt5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:36:51 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JKXmqB012688
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:36:51 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wcy5xt4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 16:36:50 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JKXl8S030061;
 Mon, 19 Jul 2021 20:36:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 39vqdtumfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 20:36:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JKamJc31064380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:36:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8864178067;
 Mon, 19 Jul 2021 20:36:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F2DB7806B;
 Mon, 19 Jul 2021 20:36:48 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 20:36:48 +0000 (GMT)
Subject: Re: [PATCH v5 08/10] tests: Use QMP to check whether a TPM device
 model is available
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
 <20210713201545.903754-9-stefanb@linux.vnet.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <ac51dacf-5310-d8a8-d15e-abf195c796fe@linux.ibm.com>
Date: Mon, 19 Jul 2021 16:36:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713201545.903754-9-stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: onpzQcQ0n_eRNs9RY_LHtXzknYozfl_9
X-Proofpoint-ORIG-GUID: V3drHxnuTSgkkYOHJWOkoRKMsjUTR5yb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_10:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I would need a tag for this one. I will only send the PR after 6.1 is out.


    Stefan

On 7/13/21 4:15 PM, Stefan Berger wrote:
> Use QMP to check whether a given TPM device model is available and if it
> is not the case then do not register the tests that require it.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   tests/qtest/bios-tables-test.c |  8 +++----
>   tests/qtest/tpm-emu.c          | 38 ++++++++++++++++++++++++++++++++++
>   tests/qtest/tpm-emu.h          |  2 ++
>   3 files changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4ccbe56158..0a78ddb5d1 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1094,7 +1094,6 @@ uint64_t tpm_tis_base_addr;
>   static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>                                 uint64_t base, enum TPMVersion tpm_version)
>   {
> -#ifdef CONFIG_TPM
>       gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
>                                             machine, tpm_if);
>       char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> @@ -1140,9 +1139,6 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>       g_free(tmp_dir_name);
>       g_free(args);
>       free_test_data(&data);
> -#else
> -    g_test_skip("TPM disabled");
> -#endif
>   }
>   
>   static void test_acpi_q35_tcg_tpm_tis(void)
> @@ -1518,7 +1514,9 @@ int main(int argc, char *argv[])
>               return ret;
>           }
>           qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
> +        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
> +            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
> +        }
>           qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>           qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>           qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 32c704194b..2994d1cf42 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -16,6 +16,8 @@
>   #include "backends/tpm/tpm_ioctl.h"
>   #include "io/channel-socket.h"
>   #include "qapi/error.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qmp/qstring.h"
>   #include "tpm-emu.h"
>   
>   void tpm_emu_test_wait_cond(TPMTestState *s)
> @@ -192,3 +194,39 @@ void *tpm_emu_ctrl_thread(void *data)
>       object_unref(OBJECT(lioc));
>       return NULL;
>   }
> +
> +bool tpm_model_is_available(const char *args, const char *tpm_if)
> +{
> +    QTestState *qts;
> +    QDict *rsp_tpm;
> +    bool ret = false;
> +
> +    qts = qtest_init(args);
> +    if (!qts) {
> +        return false;
> +    }
> +
> +    rsp_tpm = qtest_qmp(qts, "{ 'execute': 'query-tpm'}");
> +    if (!qdict_haskey(rsp_tpm, "error")) {
> +        QDict *rsp_models = qtest_qmp(qts,
> +                                      "{ 'execute': 'query-tpm-models'}");
> +        if (qdict_haskey(rsp_models, "return")) {
> +            QList *models = qdict_get_qlist(rsp_models, "return");
> +            QListEntry *e;
> +
> +            QLIST_FOREACH_ENTRY(models, e) {
> +                QString *s = qobject_to(QString, qlist_entry_obj(e));
> +                const char *ename = qstring_get_str(s);
> +                if (!strcmp(ename, tpm_if)) {
> +                    ret = true;
> +                    break;
> +                }
> +            }
> +        }
> +        qobject_unref(rsp_models);
> +    }
> +    qobject_unref(rsp_tpm);
> +    qtest_quit(qts);
> +
> +    return ret;
> +}
> diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
> index fcb5d7a1d6..c33d99af37 100644
> --- a/tests/qtest/tpm-emu.h
> +++ b/tests/qtest/tpm-emu.h
> @@ -22,6 +22,7 @@
>   #include "qemu/sockets.h"
>   #include "io/channel.h"
>   #include "sysemu/tpm.h"
> +#include "libqos/libqtest.h"
>   
>   struct tpm_hdr {
>       uint16_t tag;
> @@ -50,5 +51,6 @@ typedef struct TPMTestState {
>   
>   void tpm_emu_test_wait_cond(TPMTestState *s);
>   void *tpm_emu_ctrl_thread(void *data);
> +bool tpm_model_is_available(const char *args, const char *tpm_if);
>   
>   #endif /* TESTS_TPM_EMU_H */

