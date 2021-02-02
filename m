Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313C30CD19
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 21:32:08 +0100 (CET)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72LG-000102-W2
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 15:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l72KP-0000Va-DR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:31:13 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:46516
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l72KM-0002ZA-B8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:31:12 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6A581DA02C1;
 Tue,  2 Feb 2021 21:31:06 +0100 (CET)
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
To: Eric Blake <eblake@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com> <4581723.kQ5iP5sz2Z@silver>
 <2aa107b3-b986-0788-4d2d-fcd90ad891a4@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <ca868458-d695-a8f8-69f7-98fb8a8554af@weilnetz.de>
Date: Tue, 2 Feb 2021 21:31:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2aa107b3-b986-0788-4d2d-fcd90ad891a4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.155,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.21 um 18:14 schrieb Eric Blake:

> Yes, you do have a valid argument: any compiler that is going to
> optimize on our undefined behavior, but fails to give us a -Wxyz option
> to ferret out those spots in our code in order to avoid them in the
> first place, has a poor QoI, and it is worth filing a bug against that
> compiler to have it not be so silent.  Or put another way, there is a
> subtle difference between arguing that "the compiler is miscompiling my
> program" (which is demonstrably false per the standard's permission for
> the compiler to do whatever it wants on undefined code, but if true
> would represent a regression) and "the compiler is not helping me
> eradicate undefined behavior from my dusty-deck code" (which is
> demonstrably true), and the latter is definitely worthy of being
> designated a clang bug (but not regression, rather, you just got lucky
> that your code previously did what you wanted in spite of its
> undefinedness).  And that applies whether or not we also pursue the
> parallel course of action of fixing the actual undefined-code bug in
> libtasn1 that triggered this discussion.


I agree that the compiler should have given a warning. It did not even 
with -Weverything.

The code uses NULL + offset constructs, so requires a fix.

https://gitlab.com/gnutls/libtasn1/-/merge_requests/71 fixes the unit 
tests of libtasn1 for me, maybe also the test for QEMU which I still 
have to check.

Regards,

Stefan


