Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BEA6EAB76
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:25:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlK-00013e-Jt; Fri, 21 Apr 2023 09:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqlI-00011y-F2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqlG-0003Lr-S2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so1689471f8f.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682083513; x=1684675513;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rs22xD/HxTfQqbkpMqOFq2n8ZyHz/sCb/UQrqgcP0HE=;
 b=ziinzABooU5Pp16zWO68raKjmP21v5r5ZcrAom90asn1s6d4+IFxotR9afV2EtVTGh
 t96anmfF6/qLJ9V25zTGy8/dcgZpYQVqhmHKSYNcf4f1cpjEplbFBgC4t3cxUckrE184
 ripsaapQisrtim7bC+3AUZDrFhCtJ38G0Odf20hS73bGSfsUQzkAHSPdNzves6BqVUjC
 zL9x1ptvJ+gFjZhra+ztNN+PVhxKG8lbh4lWDosGdOKoeaofR8c8i/r9xLmOA3eQqg8G
 krvulRGwdtXYvTc5lNPuC9psKO2seT2+ZwHMeB/i7mHNLru4SlwFY+wXboPJl5U5P9To
 AUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083513; x=1684675513;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rs22xD/HxTfQqbkpMqOFq2n8ZyHz/sCb/UQrqgcP0HE=;
 b=ImAe/mUO/X01SZO+RRLDjOhRRhwbFLXDnTNsVsfdxUA8iWb8JdUJ/H16kJlcw0GiNc
 KQoHY24xGSaQQInBnewImYR08VFjOJcRqBRggyhbMxolH1CNzzxo2sVWd40OcS1QP4CR
 XkFofGsqJ7bLh7SPaszDIDhrZ7dRm/LQ7DnyYKRVEQpKoMUkqxeEPM/JYZZ+Q54KPsY4
 fYAFC58balAkYP3zdM14FhbQPWNE4Vr1PmVG7ztK3OdqnNzMIgz/d3kiO0nLvUJXGJgR
 YFRNdz14btw+SsaUCE8rYj2qwLq2nLyMiWfVsgOqC0Aw1UQmk7NHRu2R58BYaXsMxZwp
 lD2Q==
X-Gm-Message-State: AAQBX9eTsTrPG5sw2BviqORuncC4JDFtKX5u6a4ctiLwD8OBbY7FpOcq
 MdP98IUwBDJn5ZfiRSoL17xhuw==
X-Google-Smtp-Source: AKy350Y/bH12jmzoDhL1WBk7Z6y70ftGPTOcfH8RyoCVvzFEi/qwhzbDuAacMoG8ihfgsJ2GLHcbXA==
X-Received: by 2002:a5d:69d0:0:b0:2f7:63f9:6cd3 with SMTP id
 s16-20020a5d69d0000000b002f763f96cd3mr3801690wrw.33.1682083513256; 
 Fri, 21 Apr 2023 06:25:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b002f9e04459desm4366046wru.109.2023.04.21.06.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:25:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EC221FFB7;
 Fri, 21 Apr 2023 14:25:12 +0100 (BST)
References: <20230421110345.1294131-1-thuth@redhat.com>
 <87ttx9bck6.fsf@linaro.org>
 <aaa99094-9cf0-3f6c-c6bb-efc8c317aa16@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel
 Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Fri, 21 Apr 2023 14:24:10 +0100
In-reply-to: <aaa99094-9cf0-3f6c-c6bb-efc8c317aa16@redhat.com>
Message-ID: <87h6t9bc5j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> On 21/04/2023 15.16, Alex Benn=C3=A9e wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
>>> See the patch description of the second patch for details.
>>> Also add the test to the MAINTAINERS file (third patch).
>>>
>>> Thomas Huth (3):
>>>    tests/avocado: Make ssh_command_output_contains() globally available
>>>    tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
>>>    MAINTAINERS: Cover tests/avocado/machine_aspeed.py
>>>
>>>   MAINTAINERS                            |  2 +-
>>>   tests/avocado/avocado_qemu/__init__.py |  8 +++++++
>>>   tests/avocado/linux_ssh_mips_malta.py  |  8 -------
>>>   tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
>>>   4 files changed, 27 insertions(+), 22 deletions(-)
>> Queued to testing/next, thanks.
>
> Thanks, but could you please remove that "self.log.info('going to
> starrt *******')" line in the second patch? That was a debugging
> left-over...

no problem, done.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

