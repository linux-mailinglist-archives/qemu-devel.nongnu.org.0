Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C912D74AFF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 12:01:13 +0200 (CEST)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqaYi-000130-Tg
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 06:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqaYT-0000ZH-Kv
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqaYQ-0003sD-2W
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:00:55 -0400
Received: from mail.ispras.ru ([83.149.199.45]:37574)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqaYP-0003q8-OE
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:00:54 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id D398054006A;
 Thu, 25 Jul 2019 13:00:49 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Michael Rolnik'" <mrolnik@gmail.com>,
	<qemu-devel@nongnu.org>
References: <20190719082647.18113-1-mrolnik@gmail.com>
 <20190719082647.18113-6-mrolnik@gmail.com>
In-Reply-To: <20190719082647.18113-6-mrolnik@gmail.com>
Date: Thu, 25 Jul 2019 13:00:52 +0300
Message-ID: <000c01d542cf$d8476a00$88d63e00$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdU+C+x17Ln727PMQUSHZcUBdJHHJAEwWldw
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] [PATCH v27 5/8] target/avr: Add limited support
 for USART and 16 bit timer peripherals
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
Cc: richard.henderson@linaro.org, 'Sarah Harris' <S.E.Harris@kent.ac.uk>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Qemu-devel [mailto:qemu-devel-bounces+patchwork-qemu-
> devel=3Dpatchwork.kernel.org@nongnu.org] On Behalf Of Michael Rolnik
> From: Sarah Harris <S.E.Harris@kent.ac.uk>
>=20
> These were designed to facilitate testing but should provide enough =
function to be useful in
> other contexts.

USART is very useful for testing, but to which model of AVR is belongs?
We also started implementation of USART and other devices in our =
internship program,
using prior version of your patches.
There were other register addresses for the registers and some of them =
even intersect
making read/write logic more complex (we looked at Atmega8).

You also mix the board and the SoC into one file, making =
hardware-on-chip harder to reuse.

I think that the structure can be revised in the following way:
Board -> SoC -> Devices

Board includes SoC, loads the firmware, and adds some external =
peripheral devices, if needed.

SoC includes embedded peripherals. It dispatches IO memory accesses and =
passes them
to the devices. In this case you can have different register addresses =
for different SoCs, but
the embedded device emulation code can be mostly the same for simple =
devices like USART.

> Only a subset of the functions of each peripheral is implemented, =
mainly due to the lack of a
> standard way to handle electrical connections (like GPIO pins).

We did not got too much results, you can check for our changes here: =
https://github.com/Dovgalyuk/qemu/tree/avr8

But we can help you in development of better version of the patches and =
split the work
for making this platform more usable.


Pavel Dovgalyuk


