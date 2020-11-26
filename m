Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAA2C4FDD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 08:57:00 +0100 (CET)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiC9C-0001P1-Jb
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 02:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1kiC7B-0000Fb-2c; Thu, 26 Nov 2020 02:54:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1kiC78-0005PB-AH; Thu, 26 Nov 2020 02:54:52 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ735sm118789; Thu, 26 Nov 2020 02:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=KM4j+IdoWFNlVw8ds3NjC19NdTNkgCzbMcKACGWEfqA=;
 b=fZqqVkOyfW8cXufWpKaMvE0uuI2/TrehvJe2Eee6fQGRDAYPU76onzmrphxN1i9YzYns
 Po7vKPliR0Wp5iKSYoi5mDm9Vut3ZXf4N6zSQfehyQkmiO7J2uN38mJ7JIB232qktUPZ
 DMzVcqk+ZImIvsk18LCz4DGNch4Uu181xPww/F7W2aFb+BvytB5L6pzflESFTzYo1VUn
 2EyGgD7WAdYNQraZTn6yrcmBXKAip06UNELIfG9w2h1Cv5/grkZh1c0xRbT0GGTWFCXq
 HJdjA5Ku6NiNzCyx81WCPsilGZzb5FGzusHoZpzx7XQMKK4bt4FK8Q32/8YT/fHqB/04 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3522mrfk69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:54:43 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AQ7AlCQ002690;
 Thu, 26 Nov 2020 02:54:43 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3522mrfk4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:54:43 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ7lSf9022793;
 Thu, 26 Nov 2020 07:54:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8hemu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 07:54:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQ7scmk46072270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 07:54:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD62E42047;
 Thu, 26 Nov 2020 07:54:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CB2F42052;
 Thu, 26 Nov 2020 07:54:37 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 07:54:37 +0000 (GMT)
Subject: [RFC PATCH 0/2] spapr: scm: Asynchronus flush hcall support
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Thu, 26 Nov 2020 01:54:36 -0600
Message-ID: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_01:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260037
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: shivaprasadbhat@gmail.com, bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nvdimm devices are expected to ensure write persistent during power
failure kind of scenarios.

The libpmem has architecture specific instructions like dcbf on power
to flush the cache data to backend nvdimm device during normal writes.

Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
doesn't traslate to actual flush to the backend file on the host in case
of file backed vnvdimms. This is addressed by virtio-pmem in case of x86_64
by making asynchronous flushes.

On PAPR, issue is addressed by adding a new hcall to
request for an explicit asynchronous flush requests from the guest ndctl
driver when the backend nvdimm cannot ensure write persistence with dcbf
alone. So, the approach here is to convey when the asynchronous flush is
required in a device tree property. The guest makes the hcall when the
property is found, instead of relying on dcbf.

The first patch adds the necessary asynchronous hcall support infrastructure
code at the DRC level. Second patch implements the hcall using the
infrastructure.

Hcall semantics are in review and not final.

A new device property sync-dax is added to the nvdimm device. When the sync-dax is off(default),
the asynchronous hcalls will be called.

With respect to save from new qemu to restore on old qemu, having the
sync-dax by default off(when not specified) causes IO errors in guests as
the async-hcall would not be supported on old qemu. The new hcall
implementation being supported only on the new  pseries machine version,
the current machine version checks may be to prevent sufficient to prevent
such migration. Please suggest what can be done.

The below demonstration shows the map_sync behavior with sync-dax on & off.
(https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)

The pmem0 is from nvdimm with With sync-dax=on, and pmem1 is from nvdimm with syn-dax=off, mounted as
/dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
/dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)

[root@atest-guest ~]# ./mapsync /mnt1/newfile    ----> When sync-dax=off
[root@atest-guest ~]# ./mapsync /mnt2/newfile    ----> when sync-dax=on
Failed to mmap  with Operation not supported

---

Shivaprasad G Bhat (2):
      spapr: drc: Add support for async hcalls at the drc level
      spapr: nvdimm: Implement async flush hcalls


 hw/mem/nvdimm.c            |    1
 hw/ppc/spapr_drc.c         |  146 ++++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_nvdimm.c      |   79 ++++++++++++++++++++++++
 include/hw/mem/nvdimm.h    |   10 +++
 include/hw/ppc/spapr.h     |    3 +
 include/hw/ppc/spapr_drc.h |   25 ++++++++
 6 files changed, 263 insertions(+), 1 deletion(-)

--
Signature


