Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0F4B3BCC
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 15:27:34 +0100 (CET)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJFqf-0007Py-44
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 09:27:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1nJFni-000628-Kt
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 09:24:31 -0500
Received: from pv50p00im-tydg10021701.me.com ([17.58.6.54]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1nJFnh-0003vx-5n
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 09:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1644762266;
 bh=yHfEGUoC3qrLspCqVt0LUdyMDoIvSvdUKk4nEYGfok8=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
 b=03pnZjIdcEtyxYBbEgZQG8xVtlu4iJfIFNS2CHLFDVDNnz0Y8NiNcV/kIhw0cKQSN
 BGgZkdrx5aPB1hhI6SsfvLVB7kri/tB/gFd4ldmCOZtOVluFLQUtqrn3H4USxIc9vC
 Fik8kaEvvSztAQtcc33V+2AfkQxhX8cGDQPsPp0OItPAXxw8JVMKiRTtqg80SfVX1c
 aMQfl0jvYB0yv62dX5wcpgOkT368Ib0rC/1yMTCe29zSbxG78Eblb77VZylnQ9OWtY
 ctH7aZlUpDtEL1hrJMQ48khNwxmb6qfQqNcpJpm831jNZOJGygv7wHOR6QHZUATv/p
 yWI63bsSPOgRg==
Received: from smtpclient.apple (unknown [139.227.155.36])
 by pv50p00im-tydg10021701.me.com (Postfix) with ESMTPSA id A7A1A3A0DF0;
 Sun, 13 Feb 2022 14:24:24 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 13 Feb 2022 22:24:16 +0800
Subject: bdrv_is_allocated
Message-Id: <78D1B049-D41D-4C60-885A-373B49D99A8B@icloud.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
X-Mailer: iPhone Mail (19D50)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-13_05:2022-02-11,
 2022-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=635 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2202130098
Received-SPF: pass client-ip=17.58.6.54;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-tydg10021701.me.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
I=E2=80=99m trying to understand this function, but seems no note in the hea=
der file, could anyone help explain this function? It will be great if there=
 is an example. Thanks in advance!

thanks=20=

