Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DB3C7036
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 14:17:32 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3HLv-0001DR-9B
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 08:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m3HK2-0007e6-Jz
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 08:15:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m3HJz-0007xl-Iv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 08:15:34 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DCAxw3037305
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KN7/wK7DKXDuZ5rwul9B08wRBynAENPRmRCZXectBYs=;
 b=SdxBcTigd42Jb8McNie/OfLIAMc7b3LybmvaHXkKWCOUio6WHhQt8fOrqPe7FD+ed//F
 N4/pozk0AUU9KmqDRUysOYV46ZzrQWUqM5D71UQ9FExe2WLCNRoV9tZk3+pFYImhDSrY
 7I8jypt+mcvHNVU/+HPDgo6zcKwywdVp/k5W2bvD11fNxk+UDVV8w3FinfD8/ZvEde65
 m4lvD4qWZelwaX9/hf069lFixKaLgrPQCliO+HFGugJ/8GpmxKvW9h4HAqE6galQpysi
 O2PElAyq+K5YupGx60OMS0ITZsGVEt5rTdezT5w1rBH3wF8zY9JrI652qORIjhVkh72c Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrgm9553-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:15:26 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DCCOb8049249
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:12:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrgm94xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 08:12:26 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DC8JoX023309;
 Tue, 13 Jul 2021 12:12:03 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 39qt3b0jb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 12:12:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DCC24S49938736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 12:12:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F257C6066;
 Tue, 13 Jul 2021 12:12:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33D12C605D;
 Tue, 13 Jul 2021 12:12:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 12:12:02 +0000 (GMT)
Subject: Re: [PATCH v4 10/10] tests: Use QMP to check whether a TPM device
 model is available
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
 <20210712204736.365349-11-stefanb@linux.vnet.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <c3ac33b0-f44f-05fc-810e-60d80b35efb4@linux.ibm.com>
Date: Tue, 13 Jul 2021 08:12:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712204736.365349-11-stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wBPrjDuTF6XA1xIwhGrt_KpTdvTFQvIM
X-Proofpoint-GUID: gNq79F4IrPFhwuoiA-HxPejHATq0aFqb
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_04:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
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


On 7/12/21 4:47 PM, Stefan Berger wrote:
> Use QMP to check whether a given TPM device model is available
> and if it is not the case then skip a test that requires it.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>
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
> +                }
> +            }
> +            qobject_unref(models);

I think this unref was too much. It tipped off s390x but none other (?).

https://travis-ci.com/github/stefanberger/qemu-tpm/builds/232529861


I fixed this in v5 (https://travis-ci.com/github/stefanberger/qemu-tpm)


I think this is generally the right approach for this test case, isn't it?


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

