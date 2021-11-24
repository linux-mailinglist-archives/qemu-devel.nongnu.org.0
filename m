Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803245C921
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:47:45 +0100 (CET)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuUq-0004Sy-A4
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:47:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reactorcontrol@icloud.com>)
 id 1mpuT4-0003ew-1L
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:45:59 -0500
Received: from st43p00im-ztdg10071801.me.com ([17.58.63.171]:53067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reactorcontrol@icloud.com>)
 id 1mpuT2-0004gK-HO
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1637768735;
 bh=SfSy6BptLMtxdfdqlPw/dJora6ks4N1j9vjUKPiuZa0=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=W1QZ9jWTZiddnkX2fB9iIxUxJl5Mih0x/WkYpLi2xUAgUhSC4mfd7ReYTNJUvXms7
 XtvxgltCYYDLQTq/0XgTvyh81Qh/xNW+zhkux/YniDqVOFnmm4uX3xS2I+5L64CPzD
 CjyhQ3tjI8fpBZYh+rVMj+tuFSHNwKG7F3DKXeavEPBh+bTsg2cXD6AttOEOUXXRQ0
 u3H1nZ2guAY6P/po2VrR7+w/Q919798gL+nF1Hm0kTZTNg25scz/zmd192p2/cQ2Uq
 aLA02mQHcWwN1Q6t84Qi+TrBksx2C+EvsLlZLGZcuD+ktS53EIuuPov9VkfT+8wDIc
 EXEz5vs7GD6fg==
Received: from smtpclient.apple (p5b2f2493.dip0.t-ipconnect.de [91.47.36.147])
 by st43p00im-ztdg10071801.me.com (Postfix) with ESMTPSA id
 4C12454006F; Wed, 24 Nov 2021 15:45:33 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.62\))
Subject: Re: [PATCH v2 04/11] 9p: darwin: Handle struct dirent differences
From: Michael Roitzsch <reactorcontrol@icloud.com>
In-Reply-To: <60659730.p4icJFLGV9@silver>
Date: Wed, 24 Nov 2021 16:45:30 +0100
Cc: qemu-devel@nongnu.org, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B4D46DD-074E-4070-BAF0-AADAD1183B33@icloud.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-5-wwcohen@gmail.com> <60659730.p4icJFLGV9@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
X-Mailer: Apple Mail (2.3693.40.0.1.62)
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-11-24=5F04:2021-11-24=5F01,2021-11-24=5F04,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=971 adultscore=0 spamscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2111240087
Received-SPF: pass client-ip=17.58.63.171;
 envelope-from=reactorcontrol@icloud.com; helo=st43p00im-ztdg10071801.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

> Are you sure d_seekoff doesn't work on macOS?

I just tried on an APFS volume on macOS Monterey and d_seekoff is always =
0, while telldir() outputs useful values.

> Because using telldir() instead
> is not the same thing. Accessing d_*off is just POD access, whereas =
telldir()
> is a syscall.

I am not sure this is the case. I have tried a quick test program:

#include <dirent.h>

int main(void)
{
	int result =3D 0;
	DIR *dir =3D opendir(".");
	while (readdir(dir)) {
		result +=3D telldir(dir);
	}
	closedir(dir);
	return result;
}

I ran it with 'sudo dtruss ./test', which should give me a trace of the =
system calls. The relevant portion is:

open_nocancel(".\0", 0x1100004, 0x0)		 =3D 3 0
sysctlbyname(kern.secure_kernel, 0x12, 0x7FF7BE49810C, 0x7FF7BE498110, =
0x0)		 =3D 0 0
fstatfs64(0x3, 0x7FF7BE498110, 0x0)		 =3D 0 0
getdirentries64(0x3, 0x7FF4A5808A00, 0x2000)		 =3D 1472 0
close_nocancel(0x3)		 =3D 0 0

The directory has more than 30 entries, but the loop does not appear to =
cause individual system calls. Instead, readdir() and telldir() appear =
to be library functions powered by this getdirentries64 syscall.

This is on Monterey. Unfortunately I cannot test if older versions of =
macOS are different.

Michael


