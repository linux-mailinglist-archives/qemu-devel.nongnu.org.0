Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA826F166E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:14:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psM1q-0003oY-Kx; Fri, 28 Apr 2023 07:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1psM1o-0003oF-DE
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:12:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1psM1m-0008So-NO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:12:40 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SB75SM032648; Fri, 28 Apr 2023 11:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zciGgTvAo6qHmP6EUeI/YYDOndzIUnMzK0/PY4ZG/0s=;
 b=jWS2ZsdUm5rHiUHniaA3e5BTy1MhhX/I+ai8WgfxevrfmRuf7lSBGExTnAy/h3aVaxU8
 5io9AzT49xZBqvUvpHTV888eWD9fOkOihv+CNfgnT+ceTh/hmppIshlKZ578Pp1kZcmo
 z0O3x8IU8BMrjJXFTuB4NPNTiVatfGAaBD8wC67SNuziWGfeKXOgxkIbXzoNiaGDTSvO
 nLGOiQRqNTZsiCHY/qDpXYZs66+FMKB6HLqo8tt2PiBBKRTFMagw6DEgrHky9L0AUN2h
 l3GP3SvfC7Ro380WkMIZo+7sx3+i+n2lQ1MM5UnEj48qoHgabLp/RCBxelWVTO0UOUwD FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q8bvdj7pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 11:12:33 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SB84kP008663;
 Fri, 28 Apr 2023 11:12:33 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q8bvdj7nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 11:12:33 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33S9bk2L007921;
 Fri, 28 Apr 2023 11:12:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3q47772vr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 11:12:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33SBCOHM61800940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 11:12:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBCCD2004D;
 Fri, 28 Apr 2023 11:12:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6306E20040;
 Fri, 28 Apr 2023 11:12:24 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Apr 2023 11:12:24 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v6 0/1] util/async-teardown: appear in
 query-command-line-options
Date: Fri, 28 Apr 2023 13:12:23 +0200
Message-Id: <20230428111224.37140-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zVcLcjhBfGQ_OSEF1Q11T0mDwq7CwHnr
X-Proofpoint-ORIG-GUID: b3GgygkHzKPAVj1tP394JqR5twDZnR7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280090
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add new -run-with option with an async-teardown=on|off parameter. It
is visible in the output of query-command-line-options QMP command, so
it can be discovered and used by libvirt.

The option -async-teardown is now redundant, deprecate it.

v5->v6
* deprecate the old -async-teardown option instead of removing it,
  since it has now appeared in 2 QEMU releases
* use -run-with as a grab bag commandline option for the async-teardown
  boolean parameter [paolo,markus,thomas]

v4->v5
* reword commit message [Markus]
* document the removal of the -async-teardown commandline option in
  docs/about/removed-features.rst [Markus]

v3->v4
* completely remove the useless -async-teardown option, since it was
  not wired up properly and it had no users [thomas]
* QEMU should be always uppercase in text and documentation [thomas]
* if the new -teardown option fails to parse, exit immediately instead
  of returning an error [thomas]

v2->v3
* add a new teardown option with an async parameter [Markus]
* reworded documentation of existing -async-teardown option so that it
  points to the new teardown option

v1->v2
* remove the unneeded .implied_opt_name initializer [Thomas]

Claudio Imbrenda (1):
  util/async-teardown: wire up query-command-line-options

 docs/about/deprecated.rst |  5 +++++
 os-posix.c                | 15 +++++++++++++++
 qemu-options.hx           | 34 +++++++++++++++++++++++-----------
 util/async-teardown.c     | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+), 11 deletions(-)

-- 
2.40.0


