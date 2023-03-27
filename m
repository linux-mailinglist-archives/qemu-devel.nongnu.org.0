Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493596CA311
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:08:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgld6-0003sh-Lw; Mon, 27 Mar 2023 08:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgld3-0003rR-OC
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:07:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgld2-0006AT-AL
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:07:13 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RAmBKR022222; Mon, 27 Mar 2023 12:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=++hB7RPuiut1Ke9pbwWY79dofGs/Y77/kCfjKAP1ejI=;
 b=dD+AyKoVOFgt5Dm11co61wHL0JJohcn+d4o7Ew2dQT4QQxc9j3/nOwr+4hvqUR2xGNac
 UIyXQnU4S4Ya3bGbwlQhUkhO0K30K7WPdGUkY2tjLk4dZ5MSsjJPbav+V19mzytagBor
 MaOHaBPzaOfhEYHHHaK5NppO+MGZ7NfV0CwVt/LmJhPyzgZlHtGzXUNfke3YP5+dOv7c
 Eol1LsfoxGc4Mo1agKiFX6sgXTMJ1vVxTQwMCbWNt6bd+nqvJQZsSw12BNORBI5y1+cz
 6nQv3lYUQY0Xg4KHrdO5/2cD0yo5FmEZqoeY0hVYuC9NTd8zr6xfgK+UF1HmWwaIJWGs iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb42pvju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:06:59 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RAqBcP007066;
 Mon, 27 Mar 2023 12:05:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb42psjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:05:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RAVZut009626;
 Mon, 27 Mar 2023 12:04:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6jr03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:04:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RC3xE415073898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 12:03:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F16A12004E;
 Mon, 27 Mar 2023 12:03:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91DE520043;
 Mon, 27 Mar 2023 12:03:57 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 12:03:57 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v4 0/1] util/async-teardown: wire up query-command-line-options
Date: Mon, 27 Mar 2023 14:03:56 +0200
Message-Id: <20230327120357.34743-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Hc0FFLA1cDnr3h3zfBHSLjR8QoJXq_59
X-Proofpoint-GUID: BG39wWP158lKNnXfdc9fqzc7s9G3vSN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303270094
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The recently introduced -async-teardown commandline option was not
wired up properly and did not show up in the output of the QMP command
query-command-line-options. This means that libvirt will have no way to
discover whether the feature is supported.

This patch fixes the issue by adding a new -teardown commandline option
with an async=on|off parameter, correctly wired up so that it appears
in the output of query-command-line-options.

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

 os-posix.c            | 15 +++++++++++++--
 qemu-options.hx       | 33 +++++++++++++++++++--------------
 util/async-teardown.c | 21 +++++++++++++++++++++
 3 files changed, 53 insertions(+), 16 deletions(-)

-- 
2.39.2


