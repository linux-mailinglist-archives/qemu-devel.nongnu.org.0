Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DB36494C0
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 15:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Nk8-0000VQ-3n; Sun, 11 Dec 2022 09:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4Nk5-0000Ux-PP; Sun, 11 Dec 2022 09:55:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4Nk3-0007Ih-Us; Sun, 11 Dec 2022 09:55:49 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BBD7P3L021976; Sun, 11 Dec 2022 14:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yPv8Yk6fhYmcObxfJRhCJP9eL8cFDjib5KTeIjXv6E0=;
 b=mECqrNf7BI9qkiUUCcco/kFlUMh7sF3B0KB3QdWQ8lfqoMuQL02NJRi/yxyL7HNbqol5
 J3YPEP2XmUyyN9M0VXkU7LXYTVTyVuDIIQO/v+v+L6cvIjNosOAIcnJhbl85ZL/9syr4
 pMpZmUYv2Cx90y0eqMuK/xrBQ2PcQs32QlomTaJk/Touir4tCXfu0MOh/YXkwet8qg63
 mDcDhLdASU0qlXR676MLI8d4UpSM38Brjbj7TlIWP3GW/ndEn3fe1UAuYam49NGau3hI
 vb9UY0NAb8DeTNlEXZRM1vd07sO65KtkfPMhi9s/dcfzpsr8XgOGO3O11Wowh/DcvKI+ Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3xqbe18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 14:55:34 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BBEtXrg020669;
 Sun, 11 Dec 2022 14:55:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3xqbe0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 14:55:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BB1I42i030142;
 Sun, 11 Dec 2022 14:55:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mchr5sgfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 14:55:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BBEtRvl26935566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Dec 2022 14:55:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7068920040;
 Sun, 11 Dec 2022 14:55:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F34320049;
 Sun, 11 Dec 2022 14:55:26 +0000 (GMT)
Received: from [9.179.28.125] (unknown [9.179.28.125])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 11 Dec 2022 14:55:26 +0000 (GMT)
Message-ID: <73314866-8989-6f5b-b934-cdfdb94759c2@linux.ibm.com>
Date: Sun, 11 Dec 2022 15:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v13 4/7] s390x/cpu_topology: CPU topology migration
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-5-pmorel@linux.ibm.com>
In-Reply-To: <20221208094432.9732-5-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ANmQJIN-KeF_lKxFwO1gSOmIXxbltmq8
X-Proofpoint-ORIG-GUID: dFaTJn9l3TxXEGXQrLDgFCH7L_l9oIIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_10,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=715 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212110134
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sorry, I made an error in this patch that break the migration.

On 12/8/22 10:44, Pierre Morel wrote:

> +
> +const VMStateDescription vmstate_cpu_topology = {
> +    .name = "cpu_topology",
> +    .version_id = 1,
> +    .post_load = cpu_topology_postload,
> +    .minimum_version_id = 1,
> +    .needed = cpu_topology_needed,
> +};

Here having no VMStateField break the migration.
Since there will be a new spin I will change this in the next with 
something like this where I also add the saving of the mtcr before the 
migration to set it back after the migration.


+/**
+ * cpu_topology_post_load
+ * @opaque: a pointer to the S390Topology
+ * @version_id: version identifier
+ *
+ * We check that the topology is used or is not used
+ * on both side identically.
+ *
+ * If the topology is in use we set the Modified Topology Change Report
+ * on the destination host.
+ */
+static int cpu_topology_post_load(void *opaque, int version_id)
+{
+    S390Topology *topo = opaque;
+    int ret;
+
+    /* Set the MTCR to the saved value */
+    ret = s390_cpu_topology_mtcr_set(topo->mtcr);
+    if (ret) {
+        error_report("Failed to set MTCR: %s", strerror(-ret));
+    }
+    return ret;
+}
+
+/**
+ * cpu_topology_pre_save:
+ * @opaque: The pointer to the S390Topology
+ *
+ * Save the usage of the CPU Topology in the VM State.
+ */
+static int cpu_topology_pre_save(void *opaque)
+{
+    S390Topology *topo = opaque;
+
+    return  s390_cpu_topology_mtcr_get(&topo->mtcr);
+}
+
+/**
+ * cpu_topology_needed:
+ * @opaque: The pointer to the S390Topology
+ *
+ * We always need to know if source and destination use the topology.
+ */
+static bool cpu_topology_needed(void *opaque)
+{
+    return true;
+}
+
+const VMStateDescription vmstate_cpu_topology = {
+    .name = "cpu_topology",
+    .version_id = 1,
+    .post_load = cpu_topology_post_load,
+    .pre_save = cpu_topology_pre_save,
+    .minimum_version_id = 1,
+    .needed = cpu_topology_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(mtcr, S390Topology),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
-- 
Pierre Morel
IBM Lab Boeblingen

