Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D136E1760F4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 18:21:41 +0100 (CET)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8olA-0008Mn-UG
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 12:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8okI-0007oh-Vb
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:20:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8okI-0001zT-0C
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:20:46 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:39477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8okH-0001yx-S2
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:20:45 -0500
Received: by mail-oi1-x22b.google.com with SMTP id r16so11042192oie.6
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 09:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=5ofHH/Tj6QblCo8wbAa3+5B3VFMa8h7CoQp0xMpVO5s=;
 b=uYBFudRQNkigLaIcdRYXFKq91nhZPpo4z2AZeDjzNZ3eTl1RNCXT4Ju7Uyf7UY8NpA
 rnVNPlDOOkUsLVtJJNc+3SqGwj8+Yo7mQ1kB3OCR9W6vidAS2sQzAiXi3O8lDqLSBDei
 hNTwm0PZM1WMOMU+Q2vGLc31qMkG46HQNllpgUqNrGbEKnLl3T5xvix1vUBNLPSUhV7h
 PbN2TrmTrV4LlVZfS5hiw2B8VExTh+ZrAkdH/ZtcY6EHkwVeiV78UO1lpMx/FhB8qCnQ
 qjKbZ1PBIdPfPqHQ/QhhKIvrM8cqRvwR0o7GsxRj8MH14/TwtscTLNPkca7rdX108YF3
 Q1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5ofHH/Tj6QblCo8wbAa3+5B3VFMa8h7CoQp0xMpVO5s=;
 b=jy8RD3S/+cWPfeYXguH9IHNT6rLL/IbMvyVUhMbCwtbniF6GgG9JXvtbRGk/TtG/+v
 QmbJuMFRfgmd5LUtkcypVRM0GkehyDGrQfEofOowhyQAPGfwPzwCthlubhiD0uVnFp3o
 zOmFIcRo2slQx43ROLiKwAmyhOyDHbpLIIMmnY0PufTlWujRwovbZhcozMRrMPhZXTWq
 2j8s9C7+OxsnJHExAgs4S5og56e6stWlybDB1WkskWIaa0h2n3EKxWwHCLu4Hk2FyeK4
 Aq9Ja8jjX6Q4rYAAILBkrjeOGTtXaIze2/ZGAv/WxDT029n4ltp9rQ1TwHIOLl1YH/ld
 iu8w==
X-Gm-Message-State: ANhLgQ3nP5PAgTtSVEaQ+5M6XH5jyHFvwiHuNytaapP6Jb59ntTRmSl5
 rlHceiWDK4KbgA0dNfDDm0tFO88HIgBgilmMxHlCacSE
X-Google-Smtp-Source: ADFU+vtc2JzMzWvej9o/T5ncMghIPeDTykZR2nzjH+fh7DyyD7E2bJBzzDhWKGqco29qFeIrqiLnOIn84C9qUB9YSyo=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr83967oif.163.1583169644668; 
 Mon, 02 Mar 2020 09:20:44 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 17:20:33 +0000
Message-ID: <CAFEAcA9rQ4_o53zfsdcGZWse3eYWksYJdYHLeUFhq6TcBX3_zw@mail.gmail.com>
Subject: CPU reset vs DeviceState reset
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22b
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

Hi; I've just noticed that although TYPE_CPU is a subclass of
TYPE_DEVICE, it seems to implement its own reset method
('reset' field in CPUClass struct) rather than just using the
DeviceClass's 'reset'.

Is there a reason for doing this, or is it just historical legacy
from TYPE_CPU originally not being a subclass of TYPE_DEVICE?

I ask because I'd like to be able to use 3-phase reset in the Arm
CPU, and I'm wondering whether it would be better to make TYPE_CPU
just use Device's reset system, or to treat TYPE_CPU as its own
base class and implement Resettable there. The former seems more
straightforward, unless I'm missing something that means we
really do need to have the reset method be different.

thanks
-- PMM

