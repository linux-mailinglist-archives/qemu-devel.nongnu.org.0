Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97569525D60
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:37:31 +0200 (CEST)
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQni-0003ea-N6
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQjb-0001I0-7q; Fri, 13 May 2022 04:33:15 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQjZ-0002IM-FP; Fri, 13 May 2022 04:33:14 -0400
Received: by mail-ej1-x633.google.com with SMTP id gh6so14912902ejb.0;
 Fri, 13 May 2022 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/vY56wCkAB2tLFVrBMxJV/241eesgdLBfHWppT+T0Wc=;
 b=IAyCqkFQikv7lw6ooTby0GaiMPyQl5fbWPswogxx/vY7RTRYuXhWEYd8kRAnfuBDOe
 DhGA0fgC27xYmDJmU8UGAt900/CvL6ZDcZP4q7o8I0sBjef1ydNvdnY4LrqdpQmoEaF/
 3Gt1hA/c1YMXQMQabjr7Y1yN94Qaop3Xj3GGQu/JMQpGYPuaOCdyFL9edmwqAwB1r0gK
 eJh5l7+xDA4zZisdmZLW5xhVyGpI8SOC5Ktj4wjh1vJkCQGJhzEZEXN8DWsO3PyyVHBw
 kLWtP65IdIkGh4M9J2LhPBUzXC5ezBxncg9lIlfLeSL3Ib4H/7MgeKW0w6hvfhbg3goD
 qOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/vY56wCkAB2tLFVrBMxJV/241eesgdLBfHWppT+T0Wc=;
 b=lULqjQ/yuONU5gx5du0FJR7vCV3MwiODKiHpsg/VcJKqyF37kBaOYOkeC7xuJ59amW
 LmJatj3o/Oqb3IrSNfJ6MFdTRh2jh9qr3wX2+GTqAnlAtA5+B8z1snIyOiviDkt1WJFR
 aj4bqw86sNQ1ngrZ5l54MOXPOM+xkXNt+hXP4LG8BzmuWE/5s+LSbodALivvO2Titoop
 GMd9cE4T9jjtKLcz6763SPNOVHADS00UJ0UwO+VIGCe7F2GXa05zgvISJt/xNAW2YqpI
 a0MLW2RJUtIrAntOLt8psiGqd9pYRWZ1VYUKM8Xgy1WovwWUpASD1nS7k0VqjfYW+5fk
 GfQg==
X-Gm-Message-State: AOAM530R8B++Di57wsFPmKUfoWtKuccXpzZoBTBA7mQQKOhXQVj5DoLE
 +G5osMw55ZQZmn4DQIkdOHM=
X-Google-Smtp-Source: ABdhPJx/yBvfRFy4TTpEusQohkmr0EYgNvfy/+5RwQWptSMQVCsT/MfY54aL0nynBOK/k7gNp0LMqQ==
X-Received: by 2002:a17:906:478c:b0:6f4:e6c6:526f with SMTP id
 cw12-20020a170906478c00b006f4e6c6526fmr3233678ejc.41.1652430791683; 
 Fri, 13 May 2022 01:33:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a50cdc9000000b0042617ba63d5sm642031edj.95.2022.05.13.01.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:33:11 -0700 (PDT)
Message-ID: <e1f96cd6-8729-1da8-9017-862c7f456779@redhat.com>
Date: Fri, 13 May 2022 10:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 5/9] tests: use tests/venv to run basevm.py-based
 scripts
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-6-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/22 02:06, John Snow wrote:
> This patch co-opts the virtual environment being used by avocado tests
> to also run the basevm.py tests. This is being done in preparation for
> for the qemu.qmp package being removed from qemu.git.
> 
> As part of the change, remove any sys.path() hacks and treat "qemu" as a
> normal third-party import.

That's already a good reason to do it, independent of qemu.qmp being 
removed from qemu.git.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/Makefile.include | 13 +++++++------
>   tests/vm/basevm.py        |  6 +++---
>   2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index ae91f5043e5..588bc999cc9 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -84,10 +84,11 @@ vm-clean-all:
>   
>   $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
>   			$(SRC_PATH)/tests/vm/basevm.py \
> -			$(SRC_PATH)/tests/vm/Makefile.include
> +			$(SRC_PATH)/tests/vm/Makefile.include \
> +			check-venv
>   	@mkdir -p $(IMAGES_DIR)
>   	$(call quiet-command, \
> -		$(PYTHON) $< \
> +		$(TESTS_PYTHON) $< \
>   		$(if $(V)$(DEBUG), --debug) \
>   		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
>   		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> @@ -101,9 +102,9 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
>   
>   
>   # Build in VM $(IMAGE)
> -vm-build-%: $(IMAGES_DIR)/%.img
> +vm-build-%: $(IMAGES_DIR)/%.img check-venv
>   	$(call quiet-command, \
> -		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
> +		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
>   		$(if $(V)$(DEBUG), --debug) \
>   		$(if $(DEBUG), --interactive) \
>   		$(if $(J),--jobs $(J)) \
> @@ -127,9 +128,9 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
>   		-device virtio-net-pci,netdev=vnet \
>   	|| true
>   
> -vm-boot-ssh-%: $(IMAGES_DIR)/%.img
> +vm-boot-ssh-%: $(IMAGES_DIR)/%.img check-venv
>   	$(call quiet-command, \
> -		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
> +		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
>   		$(if $(J),--jobs $(J)) \
>   		$(if $(V)$(DEBUG), --debug) \
>   		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 254e11c932b..d7d0413df35 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -18,9 +18,6 @@
>   import logging
>   import time
>   import datetime
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.machine import QEMUMachine
> -from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
>   import subprocess
>   import hashlib
>   import argparse
> @@ -31,6 +28,9 @@
>   import traceback
>   import shlex
>   
> +from qemu.machine import QEMUMachine
> +from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
> +
>   SSH_KEY_FILE = os.path.join(os.path.dirname(__file__),
>                  "..", "keys", "id_rsa")
>   SSH_PUB_KEY_FILE = os.path.join(os.path.dirname(__file__),


