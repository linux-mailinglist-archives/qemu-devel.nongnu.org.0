Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01E3B4406
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:06:32 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlXT-000168-Qu
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.mambu@pm.me>)
 id 1lwkDi-0003fW-TY; Fri, 25 Jun 2021 07:42:03 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:41471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.mambu@pm.me>)
 id 1lwkDg-00084R-I7; Fri, 25 Jun 2021 07:42:02 -0400
Date: Fri, 25 Jun 2021 11:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1624621313; bh=MeryMRZL5gKlM1vis136dXJAxZtNXuJ+soGLw7Bbibs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Zi1OrT79jhTEX9jKtxTIdxs5pmA1sTyzQhPkjAHtm+jfilVNBc8ORM9Ced7NAlV+n
 FfZxIMVZ6QzWQ6eJs4EBDm30lnbo7Wz2huMk72FXbPD0YQjyfhmtCOQC/n0GTMYG+k
 jALBihUTe2eOaeXfhvCz8f2JJye7SBVUz5OZ+XW6hgBCiOenHHQyudShAkVrgmJg0w
 igymXzq+GHqvyoz6/bYRt5nzCtlRVi3RPUxvReHgza8hco1rmfdsomJfg5dkXcQc2I
 i1ZqxId40O/Ki20W2orJv1O0+qKcaG+E8ZLXj+i7hw16JWB1QrmqVtcuXTh/3ZOyVz
 lCO0gboIcL9ww==
To: Peter Maydell <peter.maydell@linaro.org>
From: Kevin Mambu <kevin.mambu@pm.me>
Cc: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Difficulties to access guest memory in TCG plugins
Message-ID: <smmw67gZkSbpUdasGudL9EjsOh-cqnmPdYG2Ct7lJI6GBl80aoiI8v3mIYbRC7EpLMJ8pikBAgCTN9uktffTn-iZ9_hM8G3Z5t7qpxXwJPk=@pm.me>
In-Reply-To: <CAFEAcA-tS51CCvEB4eG7vkB+edTrZyxNV29YV++XF5SNw_4D+w@mail.gmail.com>
References: <o1Yk83q9b8fPEPYKowd-FS7TM3GAByNtQScLqBwokjniIxwBv-rLo3gQU5MAjLDZGJn9hOGiPudeSXvp3TS-QxouCtlVqHbsnGqXf8dKs_k=@protonmail.com>
 <6c51799c-6882-c459-0996-325c58de87fd@amsat.org> <87zgvfqc5y.fsf@linaro.org>
 <ue5FWr9Im37PzO94ccnHkiZJawfs6i4R8DdYdA5aVq_8BJHXDFLa4ojQpN1CIh5trBH4wiAZNTPzy1V98TQFX4FPh_Z7jngXuYNTaR_hSS4=@pm.me>
 <CAFEAcA-tS51CCvEB4eG7vkB+edTrZyxNV29YV++XF5SNw_4D+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=51.77.79.158; envelope-from=kevin.mambu@pm.me;
 helo=mail-0201.mail-europe.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Jun 2021 09:03:03 -0400
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
Reply-To: Kevin Mambu <kevin.mambu@pm.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This really isn't what the plugin API is intended for -- it's meant
>
> for tracing and similar sorts of "track what the guest is doing" activiti=
es.
>
> If you want to model an MMIO device, you're better off just writing a dev=
ice
>
> model like any of the others in QEMU, I think: the APIs for doing that
>
> are much more well-proven and there's plenty of examples in the tree
>
> of DMA and other devices.
>

Thank you for your response. Indeed, it seems that trying to circumvent the=
 functionalities offered by the Plug-in API will not allow me to properly a=
chieve the modeling of my device. As of now I have a pretty tight schedule =
but in the near future, I will implement my MMIO device using the appropria=
te API ; I found the source code of the QEMU educational PCI device.

Thanks for your help, everyone :)

K=C3=A9vin Mambu


