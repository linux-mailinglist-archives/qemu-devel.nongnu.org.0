Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBC3ADAE1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 18:26:38 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludnp-0003IS-6m
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 12:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ludn4-0002X7-MD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 12:25:50 -0400
Received: from pv34p98im-ztdg02162201.me.com ([17.143.234.141]:59142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ludn3-0006NR-4Y
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 12:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1624119946; bh=ocuzAlgR1wGtT19eO9TIrsuDhafKXykU1PC2zlrnQzo=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=oQ2ViO9VpR5n27Z50+q92ClLyoligfNVr5+Owjsw5NecI02lWTooOh4FGMbz8ps26
 UoAgf4D/9Bv9U166SNP1c8iOoFX7UAlV16Rq0/dgvh2kWK+VJ4S7Piaz0F7yRB1zyw
 lEvqrY+xxs0A/J4M9E7DhTYoXQo8AlNcdMfIzyARcBbnAogoZ91TtMbAJyQKp5bgqx
 4g7w2mCvUionCgOZ8jI6b5GkP/9fGY1Pi1423sn+UcQ6xQWeeSWQCVObvWWS1ENmhW
 Tr0xMyz8sF4cPyAVAWYQUbN5+vG+LXmyrkmL3VO0uq0w9Qm21xvrOu8BGPW4pDa4KJ
 rs96upiMB21KA==
Received: from smtpclient.apple (unknown [17.11.19.150])
 by pv34p98im-ztdg02162201.me.com (Postfix) with ESMTPSA id 490B31C0048;
 Sat, 19 Jun 2021 16:25:45 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3679.0.2\))
Subject: Re: [PATCH 1/4] mc146818rtc: Make PF independent of PIE
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <72b9ed14-3af0-8284-9baf-f1a552e61b5f@amsat.org>
Date: Sat, 19 Jun 2021 09:25:43 -0700
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F38D48C3-EC76-4102-80B1-B876181D3BA6@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-2-thorpej@me.com>
 <5c2ae675-f734-174d-6640-baebc817f3ba@linaro.org>
 <39CACE5E-7CCD-400C-A983-689474D42EC5@me.com>
 <72b9ed14-3af0-8284-9baf-f1a552e61b5f@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3679.0.2)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-19_13:2021-06-18,
 2021-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=651 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106190110
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



> On Jun 19, 2021, at 8:56 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> Hi Jason,
>=20
> Do you mind reposting this single patch including the DS quote
> in the description?

Sure, no problem.  Will do so shortly.

-- thorpej


