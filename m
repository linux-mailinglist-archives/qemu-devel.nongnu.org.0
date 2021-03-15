Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA633C3B1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:11:59 +0100 (CET)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLql4-00032h-Iz
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lLqXi-0004wJ-3Z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:58:10 -0400
Received: from 13thmonkey.org ([80.100.255.32]:58983
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lLqXg-000817-8V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:58:09 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 44515C13ADD; Mon, 15 Mar 2021 17:58:05 +0100 (CET)
Date: Mon, 15 Mar 2021 17:58:04 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n3Tq2PyLAzpwfY1V"
Content-Disposition: inline
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


--n3Tq2PyLAzpwfY1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

with the introduction of the following patch from 17th of February, Win10
won't boot anymore without explicitly setting the machine to be 5.2 compatible
like pc-1440fx-5.2. The default 6.0 will cause it to panic and gives as reason
only "ACPI error".

It might work to counter a bug in Linux but this is not the place to do the
patch. The BSDs don't care and will boot fine with full ACPI regardless of the
machine chosen. Windows 10 however DOES care and gets confused.

I think its better to revert this and fix Linux ;) or make it a selectable
feature as a workaround that's by default OFF :)

With regards,
Reinoud


The patch concerned is:

commit 6be8cf56bc8bda2ed9a070bdb04446191f31acc9
Author: Isaku Yamahata <isaku.yamahata@intel.com>
Date:   Wed Feb 17 21:51:12 2021 -0800

    acpi/core: always set SCI_EN when SMM isn't supported
    
    If SMM is not supported, ACPI fixed hardware doesn't support
    legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
    always set.
    The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).
    
    With the next patch (setting fadt.smi_cmd = 0 when smm isn't enabled),
    guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
    fails to initialize acpi subsystem. This patch proactively fixes it.
    
    This patch changes guest ABI. To keep compatibility, use
    "smm-compat" introduced by earlier patch. If the property is true,
    disable new behavior.
    
    ACPI spec 4.8.10.1 PM1 Event Grouping
    PM1 Eanble Registers
    > For ACPI-only platforms (where SCI_EN is always set)
    
    Reviewed-by: Igor Mammedov <imammedo@redhat.com>
    Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
    Message-Id:
<500f62081626997e46f96377393d3662211763a8.1613615732.git.isaku.yamahata@intel.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

 hw/acpi/core.c         | 11 ++++++++++-
 hw/acpi/ich9.c         |  2 +-
 hw/acpi/piix4.c        |  3 ++-
 hw/core/machine.c      |  5 ++++-
 hw/isa/vt82c686.c      |  2 +-
 include/hw/acpi/acpi.h |  4 +++-
 6 files changed, 21 insertions(+), 6 deletions(-)



--n3Tq2PyLAzpwfY1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBPkhoACgkQgpw3AEPI
qmhdWAf/aimdwRWZevc1EZ2Girys9MpRAc2dpLhAr+RhFFSuqdH3Wv20J9uaAeTn
1yqyIv8NHyLdllVdEpeEFZ/rQddAjHVKwMaLgXZqPsQy1x+sVCEHHHkgva9xWn5c
Bco2xx7jnpAmlNlEwAlD1e09NlJ3GYCmtt1pkpiyenZ8DUhZFmkMgHzP3FjXf2uy
GA+8/hFICs8hkYsx82spIq5f58foifuE12GqDRCf3svBlFMClQ1kvh5h6w7f/2RX
uH43lNcK65BmAdKIsHqwCkwiiXvWPkgtFescMmh41+tMSmhmyG4SLqQZ/vRa58IT
RfLwXGfhOSnDZ9FPY8F/4kaEn9prfA==
=55oT
-----END PGP SIGNATURE-----

--n3Tq2PyLAzpwfY1V--

