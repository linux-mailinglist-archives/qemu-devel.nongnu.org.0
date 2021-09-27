Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC049419159
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:12:10 +0200 (CEST)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUmgD-0006wh-VT
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mUmdp-0005PM-HS; Mon, 27 Sep 2021 05:09:41 -0400
Received: from mail.ispras.ru ([83.149.199.84]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mUmdn-0001Sf-2I; Mon, 27 Sep 2021 05:09:41 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9A80C40A2BC3;
 Mon, 27 Sep 2021 09:09:28 +0000 (UTC)
Subject: Re: [PATCH 00/16] Acceptance Tests: use Avocado 91.0 features and
 other improvements
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <847a223c-847a-ac47-8ef0-617cd73b1f99@ispras.ru>
Date: Mon, 27 Sep 2021 12:09:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924185506.2542588-1-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.478,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Cleber!

What about record/replay tests from 25.06?

On 24.09.2021 21:54, Cleber Rosa wrote:
> This is a collection of patches for the Acceptance Tests to leverage
> some of the features of Avocado 91.0.  With the Avocado version bump
> by itself, there would be a change in the default "test runner"
> implementation that Avocado uses, from the one simply known as
> "runner" to the new one called "nrunner".
> 
> Among the changes from one implementation to the other, is the fact
> that "nrunner" will run tests in parallel by default.  This is *not
> yet* enabled by default on "make check-acceptance", but users can
> choose to use simply by setting the "AVOCADO_RUNNER" variable, that
> is:
> 
>    make AVOCADO_RUNNER=nrunner check-acceptance
> 
> If you are curious about the architectural differences of the nrunner,
> please refer to:
> 
>    https://avocado-framework.readthedocs.io/en/91.0/guides/contributor/chapters/runners.html
> 
> One other noteworthy proposal is a convention to tag tests that either
> have known issues, or that touch on QEMU features that have known
> issues.  By tagging those tests accordingly, they will be
> automatically excluded from the regular execution with "make
> check-acceptance".
> 
> Finally, some updates to assets locations and some tests refactors and
> cleanups.
> 
> Cleber Rosa (16):
>    Acceptance Tests: bump Avocado requirement to 91.0
>    Acceptance Tests: improve check-acceptance description
>    Acceptance Tests: add mechanism for listing tests
>    Acceptance Tests: keep track and disable tests with known issues
>    Acceptance Tests: add standard clean up at test tearDown()
>    Acceptance Tests: use extract from package from avocado.utils
>    Acceptance Tests: workaround expired mipsdistros.mips.com HTTPS cert
>    acceptance/tests/vnc.py: use explicit syntax for enabling passwords
>    tests/acceptance/boot_xen.py: merge base classes
>    tests/acceptance/boot_xen.py: unify tags
>    tests/acceptance/boot_xen.py: fetch kernel during test setUp()
>    tests/acceptance/boot_xen.py: removed unused import
>    tests/acceptance/boot_xen.py: use class attribute
>    tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2 location update
>    tests/acceptance/ppc_prep_40p.py: clean up unused import
>    tests/acceptance/ppc_prep_40p.py: unify tags
> 
>   docs/devel/testing.rst                    | 40 ++++++++++
>   tests/Makefile.include                    | 15 +++-
>   tests/acceptance/avocado_qemu/__init__.py |  1 +
>   tests/acceptance/boot_linux_console.py    | 93 +++++++++--------------
>   tests/acceptance/boot_xen.py              | 54 ++++---------
>   tests/acceptance/machine_rx_gdbsim.py     |  3 +
>   tests/acceptance/ppc_prep_40p.py          | 17 ++---
>   tests/acceptance/replay_kernel.py         | 18 ++---
>   tests/acceptance/tcg_plugins.py           |  2 +-
>   tests/acceptance/vnc.py                   |  2 +-
>   tests/requirements.txt                    |  2 +-
>   11 files changed, 128 insertions(+), 119 deletions(-)
> 


