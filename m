Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68D39BF8D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:25:51 +0200 (CEST)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEVx-0001h3-VI
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lpETn-0003Vu-H9
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:23:36 -0400
Received: from pv34p98im-ztdg02162201.me.com ([17.143.234.141]:39176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lpETj-0000pV-BW
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622831005; bh=1r64zNWTnvetKp1cLCRSpeRPR1tUznyQoeG/bMatg2k=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=y7erGdTfSkKIg9WRrosF16VImtwLkUAkAVA68iAQNrmQCWm/qzTPIuN6B7vHplePH
 Mr+yS+4cwRmHP2hgLhzlNcUYVunmjYM20tnVZUTbeEmnCNLZUB2h/WU9oBE/ikaIGD
 2rOxKg9NsyPdnwX6h3W8z/ZjOGEmIgulF5/a5btgbcjmbLZluAtLsiYdKNVZNYOr1w
 VTHNbNY3TR2Zg6ZzAlpDhY3nJk0zqr1FOkKNm2yvrA3W2LesVBFRjBCD8k3XWcOvTd
 4Mjs8C4l6LROSeET4VWQP7bzlnyB63/mwgcmgnH6VZR4KxD1ROy2o8N1jQlnKSGPTw
 92LjQpBItM8pg==
Received: from smtpclient.apple (unknown [17.234.102.237])
 by pv34p98im-ztdg02162201.me.com (Postfix) with ESMTPSA id CF5291C00CE;
 Fri,  4 Jun 2021 18:23:24 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH 5/8] Fix incorrect initialization of PCI BARs.
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <5df6a368-ad13-77e6-7ebc-cab34b04577f@amsat.org>
Date: Fri, 4 Jun 2021 11:23:23 -0700
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1B2B980-72EA-4A89-9D0D-64B2AD7F9562@me.com>
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-6-thorpej@me.com>
 <5df6a368-ad13-77e6-7ebc-cab34b04577f@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_12:2021-06-04,
 2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=683 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106040130
Received-SPF: pass client-ip=17.143.234.141; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02162201.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On Jun 3, 2021, at 2:24 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> Hi Jason,
>=20
> On 6/3/21 5:53 AM, Jason Thorpe wrote:
>> Only program a BAR as a 64-bit MEM BAR if it really is a 64-bit MEM =
BAR.
>> Fixes an issue with the CMD646 IDE controller under NetBSD.
>=20
> OK for this fix,
>=20
>>=20
>> Improve some debug/info messages.
>=20
> but I'm not sure why you changed the format.
> Better split in 2 patches.

I'm not particularly wedded to the printf format changes.  I tweaked =
them when I was debugging the problem.  I'll update the patch with the =
printf format changes elided.

-- thorpej


