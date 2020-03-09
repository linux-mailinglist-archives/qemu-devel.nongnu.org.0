Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADE17ECF6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 00:59:29 +0100 (CET)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBSIy-0006ZB-Nl
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 19:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jBSDv-0007q3-Ic
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jBSDu-00085v-H4
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:54:15 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jBSDu-00084w-9P
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:54:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 029NsC5p078551;
 Mon, 9 Mar 2020 23:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=/VM0a+l9zSncUdl9mA7YhVNRi9Jjx2Lm4m36gx6ZqOg=;
 b=xXOEpG9NqJNt0rOrhEKXxmGhEVtvQOl1bLtMNMaAr5q/KreTW1I2XwxgIQx3qOjXLBeK
 SHUHl85B3Sz4dEpxGA2Ju7azhkaYhBIZE9jfckR0anhRSc7/Va51np8Q9F+MP1RzMPtJ
 rSDHEv6mtpSd7oNb+btPBkeULQrRv/Ff5mBYwAUVnyfpu7scvof9hjnaew7oHUedb2tk
 zFY8WXSL6SxeJYcl+PuUBRwVkRVbjBSVxqRyy8idHA7sh9jQqiVKY++bbs5t/Un4uZYC
 g1XQ5bVxLAa2Gzf7mtOYemP7RIAzg1i0UIp8V1dkKQhB6ICNvASUXhAhfJVzBIz8MtuN LA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2ym48st1at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Mar 2020 23:54:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 029Nh7FZ120713;
 Mon, 9 Mar 2020 23:52:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2ymn3hcfg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Mar 2020 23:52:12 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 029NqA6V010794;
 Mon, 9 Mar 2020 23:52:11 GMT
Received: from spark.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Mar 2020 16:52:10 -0700
From: Liran Alon <liran.alon@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14]: hw/i386/vmport: Bug fixes and improvements
Date: Tue, 10 Mar 2020 01:53:57 +0200
Message-Id: <20200309235411.76587-1-liran.alon@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 mlxlogscore=644 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=709 suspectscore=1 priorityscore=1501 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090144
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series aims to fix several bugs in VMPort and improve it by supporting
more VMPort commands and make command results more configurable to
user via QEMU command-line.

This functionality was proven to be useful to run various VMware VMs
when attempting to run them as-is on top of QEMU/KVM.

For more details, see commit messages.

Regards,
-Liran


