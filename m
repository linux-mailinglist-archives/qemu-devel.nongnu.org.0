Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5214530CD52
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 21:52:25 +0100 (CET)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72eu-0006e0-Cj
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 15:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l72dP-00060s-AN
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:50:51 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:46648
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l72dI-0003I9-BD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:50:50 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6D089DA1401;
 Tue,  2 Feb 2021 21:50:40 +0100 (CET)
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
From: Stefan Weil <sw@weilnetz.de>
To: Eric Blake <eblake@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com> <4581723.kQ5iP5sz2Z@silver>
 <2aa107b3-b986-0788-4d2d-fcd90ad891a4@redhat.com>
 <ca868458-d695-a8f8-69f7-98fb8a8554af@weilnetz.de>
Message-ID: <55ade56a-2c1d-c89f-a71e-fa63db272ccf@weilnetz.de>
Date: Tue, 2 Feb 2021 21:50:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ca868458-d695-a8f8-69f7-98fb8a8554af@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.155,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Am 02.02.21 um 21:31 schrieb Stefan Weil:

> The code uses NULL + offset constructs, so requires a fix.
>
> https://gitlab.com/gnutls/libtasn1/-/merge_requests/71 fixes the unit 
> tests of libtasn1 for me, maybe also the test for QEMU which I still 
> have to check.
>

The QEMU test passes with the patch for libtasn1:

stefan@mini clang % tests/test-crypto-tlscredsx509
# random seed: R02S0b9c3f2459ee914a95bb1f9e28441dd9
1..39
# Start of qcrypto tests
# Start of tlscredsx509 tests
ok 1 /qcrypto/tlscredsx509/perfectserver
ok 2 /qcrypto/tlscredsx509/perfectclient
ok 3 /qcrypto/tlscredsx509/goodca1
ok 4 /qcrypto/tlscredsx509/goodca2
ok 5 /qcrypto/tlscredsx509/goodca3
ok 6 /qcrypto/tlscredsx509/badca1
ok 7 /qcrypto/tlscredsx509/badca2
ok 8 /qcrypto/tlscredsx509/badca3
ok 9 /qcrypto/tlscredsx509/goodserver1
ok 10 /qcrypto/tlscredsx509/goodserver2
ok 11 /qcrypto/tlscredsx509/goodserver3
ok 12 /qcrypto/tlscredsx509/goodserver4
ok 13 /qcrypto/tlscredsx509/goodserver5
ok 14 /qcrypto/tlscredsx509/goodserver6
ok 15 /qcrypto/tlscredsx509/goodserver7
ok 16 /qcrypto/tlscredsx509/badserver1
ok 17 /qcrypto/tlscredsx509/badserver2
ok 18 /qcrypto/tlscredsx509/badserver3
ok 19 /qcrypto/tlscredsx509/goodclient1
ok 20 /qcrypto/tlscredsx509/goodclient2
ok 21 /qcrypto/tlscredsx509/goodclient3
ok 22 /qcrypto/tlscredsx509/goodclient4
ok 23 /qcrypto/tlscredsx509/goodclient5
ok 24 /qcrypto/tlscredsx509/goodclient6
ok 25 /qcrypto/tlscredsx509/goodclient7
ok 26 /qcrypto/tlscredsx509/badclient1
ok 27 /qcrypto/tlscredsx509/badclient2
ok 28 /qcrypto/tlscredsx509/badclient3
ok 29 /qcrypto/tlscredsx509/expired1
ok 30 /qcrypto/tlscredsx509/expired2
ok 31 /qcrypto/tlscredsx509/expired3
ok 32 /qcrypto/tlscredsx509/inactive1
ok 33 /qcrypto/tlscredsx509/inactive2
ok 34 /qcrypto/tlscredsx509/inactive3
ok 35 /qcrypto/tlscredsx509/chain1
ok 36 /qcrypto/tlscredsx509/chain2
ok 37 /qcrypto/tlscredsx509/missingca
ok 38 /qcrypto/tlscredsx509/missingserver
ok 39 /qcrypto/tlscredsx509/missingclient
# End of tlscredsx509 tests
# End of qcrypto tests


