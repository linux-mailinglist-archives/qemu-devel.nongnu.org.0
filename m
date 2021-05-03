Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F7371C6F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:53:55 +0200 (CEST)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbpS-0008SQ-Oe
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbme-00069B-Rx
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:51:00 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbmb-0001oA-LA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:51:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id b25so8897976eju.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=F3pEXl1UQwLb4jMs7uunS8lP7x7VdqFs0CkqL1Il4N4=;
 b=eU6I88IvI/lRFs5ZNgE7buSFxV1+Kskcd+Q/Hh0JejrlkEmsOVRA82N1ZtWd9Ea9H5
 9TA7izOhNq/WVfg5xNObZr/d/W1rBLCizMdRvTevll0n4RmSuSERr6juhBcH4LT5Jq72
 WgrI7VJEVo8ZlIstFAY065Bi368gs1wo1zHSmkaNYUA295d6SAz7ce0lLyzzkFAlpVY9
 J8JSYPKqn2mlOM//3vcQ3vBBa5ENZwzwqPWHoeryKkRL7BFVKd1Bqx80DNi859dsjy0Q
 bMoVzpQKx5VCUE/SzDLSxKIzZe2WnM9sk+8S8XI4p+GDET0tsXw1nnA4XhMmw8Fw1P5O
 b5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=F3pEXl1UQwLb4jMs7uunS8lP7x7VdqFs0CkqL1Il4N4=;
 b=OgpkO0yW/yi7tonm9fH8BDbEhHxSnPbOCbcp3Lp/DlXhdbjliPiaDMjYeDJIKx/eUH
 QkLzfOXEGpfVmBef9GZtFNwm6IdxyP0tXamXgvGSB+hTJ4G+q9cBghCJ4ji4QtS+uHOd
 1sXtf4VtV3z91vQhEUA2CTrQOO6ODkf6x0bni8AsDdc8+Gdl0R5K70+PpOdYAGLw+sZe
 D0NkJSinCeTcgzpttVszS2gCc+isvu4ZOEYhKQ6GBVqZ/FDb1EsOvaBcJ0QumosvGW0I
 PsHWNn88N7w0WJx77lgQGblAlUJYcBbnE7Fy1DtuLgsyBr13nEkTUDlP2c/onJuG1lqq
 mv1g==
X-Gm-Message-State: AOAM5328K9+vUNbxcmJi3xe4BpEGtsqNsev9tpcQl941Sm+dP0UluerS
 WYR37D3kr2MDzTy1NDTfs3QbWK+eEa0K18BSA96OOfMaQgD76A==
X-Google-Smtp-Source: ABdhPJxjqHWlJBr9+imArDVvxxkT04GtSiFiW+kSpmYfVRns/Lz/3hLs3hpkZYjR1kxyGnpYDYQ4EbW/jLchRQSiPMc=
X-Received: by 2002:a17:906:3115:: with SMTP id
 21mr10728170ejx.482.1620060655669; 
 Mon, 03 May 2021 09:50:55 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 May 2021 17:49:50 +0100
Message-ID: <CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com>
Subject: QEMU tests, Coverity, and g_test_set_nonfatal_assertions()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we generally assume that assertions are always present
and always fatal, and we tell Coverity this by putting this into
our model file:

void g_assertion_message_expr(const char     *domain,
                              const char     *file,
                              int             line,
                              const char     *func,
                              const char     *expr)
{
    __coverity_panic__();
}

However, this doesn't work for the tests, which use a variety
of other assertion macros like g_assert_cmpstr(), g_assert_true(),
etc, because those glib macros turn into calls to other functions:
 g_assertion_message
 g_assertion_message_cmpstr
 g_assertion_message_cmpnum
 g_assertion_message_error
which we don't model.

So, we could just add models of those four functions. However,
in some of our tests we call g_test_set_nonfatal_assertions()
(which does what it says on the tin for the g_assert_something
macros, but *not* for plain g_assert() or g_assert_not_reached()).
The rationale here is that non-fatal assertions for code in the
glib test framework allow failures to be reported cleanly as
"this test failed", whereas an abort will give less useful
information, eg it doesn't report the test failure name and
it doesn't proceed to do further tests in the same test binary:

**
ERROR:../../../tests/qtest/npcm7xx_rng-test.c:256:test_first_byte_runs:
assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) >
0.01): (0.00204666737 > 0.01)
Bail out! ERROR:../../../tests/qtest/npcm7xx_rng-test.c:256:test_first_byte_runs:
assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) >
0.01): (0.00204666737 > 0.01)
Aborted

vs

**
ERROR:../../../tests/qtest/npcm7xx_rng-test.c:232:test_first_byte_monobit:
assertion failed (calc_monobit_p(buf, sizeof(buf)) > 0.01):
(4.78548397e-05 > 0.01)
# ERROR:../../../tests/qtest/npcm7xx_rng-test.c:232:test_first_byte_monobit:
assertion failed (calc_monobit_p(buf, sizeof(buf)) > 0.01):
(4.78548397e-05 > 0.01)
not ok 5 /arm/npcm7xx_rng/first_byte/monobit
ok 6 /arm/npcm7xx_rng/first_byte/runs

Of course test code that opts into this needs to be prepared for
its g_assert_something() to return even on failure. But if we make
our Coverity model treat all these kinds of g_assert_something as
fatal-on-failure then we won't be able to use Coverity to identify
places in these tests that would accidentally crash on failure.

In summary, we have a few options:

(1) Expand "assertions always fatal" to test code, and add "panics"
models of the g_assertion_message* functions. Remove all the calls
to g_test_set_nonfatal_assertions().

(2) Aim to expand the ability to use g_test_set_nonfatal_assertions()
to other tests than the handful that currently use it (perhaps by
providing a standard place where it gets called for all tests, though
there isn't currently an obvious place to do that). Treat Coverity
issues in our test code which flag up "this would crash if the
assertion fired but execution continued" as bugs to be fixed (though
not very high-priority ones, obviously).

(3) Something else ?

I think I vaguely favour 2, though it is of course more work...
In any case, we need to make a decision so we can decide whether
the pile of coverity issues should be either dismissed as intentional
or gradually worked through and fixed.

thanks
-- PMM

