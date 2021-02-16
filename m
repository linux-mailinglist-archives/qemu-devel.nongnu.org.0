Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D031C92B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:58:21 +0100 (CET)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBy3g-0000VI-CZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBxvK-0007Mt-7U
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBxvI-0007Gv-Jv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613472579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irx30eBMANQXeuqbnjT81MsTSgUzHfdVUFM1EItoh6U=;
 b=VI4nGzpwFi90oJgX1S8qIJhgFXx1oyETudw4uDuIk4r3zvkGK0ELOCf4Wh+7zcxOZjhwmJ
 BnQT7FwlilJlBUkVo7cwFV/2GPuy21HmXd4uggq2kROFRVIiOUT7EJnxgTcg8nTa01Es6I
 UQnmeO3jdShQsmhZBJIma75o+URn9AE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-7v345EBsOuuZ3kq3EgcWnQ-1; Tue, 16 Feb 2021 05:49:36 -0500
X-MC-Unique: 7v345EBsOuuZ3kq3EgcWnQ-1
Received: by mail-wr1-f71.google.com with SMTP id b3so8330180wro.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=irx30eBMANQXeuqbnjT81MsTSgUzHfdVUFM1EItoh6U=;
 b=CgnwlmowSFXXJ2s1XIEqk/eCzH2WjePMqjfE9RfkmbYpiT0nkyZuGcviKnw8K2RGPP
 teC6udulVCt0IXIS935ACm2rBMcEe/ql6bJerC7RCxS/Mkr0CuX0Fj9+hygNhWTM4q6O
 ydompjXeCfBAQt7yJpQrihhtkqWMq5q2rZBYHB6fBb3LSMkFIxF5JAHcUGkuSW/ZFYY7
 x3JZSOdusa7Ksa1qc5FEDwHICx9cALuYpVMQ7iejZhIrCmyC9s7wg5JyigrykHP0pwAN
 yDqV0KgRhfGG6CYBgAicaxZKZjP4bH+p7IJ70y9DxCoTtmFoa+26ZZsQJK8NVBeG7UnI
 tymQ==
X-Gm-Message-State: AOAM531oFKn+rZqjfF0IALMwb1PoeASGQn7paQ/Rgyjhn3pbGNbw7HGk
 0eYamfsy62Kto4c4iHSPD3kK0HyhVvitvQQ6GbMtRV2i5zx6GOvQ067fpzFEGLtl9n5oWgtRYw/
 aaxVGc4hGbqgdVfM=
X-Received: by 2002:a1c:48c4:: with SMTP id v187mr2713126wma.145.1613472574930; 
 Tue, 16 Feb 2021 02:49:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwupi83f77z+oEZ3f2IjBl6SSByYiY5xBmI8kwocZBtdMNEYonSU0wJNC5DBBS2nbfuSBMX8g==
X-Received: by 2002:a1c:48c4:: with SMTP id v187mr2713116wma.145.1613472574757; 
 Tue, 16 Feb 2021 02:49:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x13sm3195257wmc.27.2021.02.16.02.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 02:49:34 -0800 (PST)
Subject: Re: [PATCH v2] meson.build: expose TCG cross compiler information in
 summary
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210216102522.6279-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a0db0e73-debc-a712-570b-cc38278884f2@redhat.com>
Date: Tue, 16 Feb 2021 11:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210216102522.6279-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 11:25, Alex Bennée wrote:
> Blink and you miss the cross TCG compiler stuff so lets display it
> with the rest of the compiler information.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use target_dirs/fs.exists() instead of find

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Using $(wildcard) could be better than TARGET_DIRS in 
tests/Makefile.include, too, something like this:

diff --git a/tests/Makefile.include b/tests/Makefile.include
index d34254fb29..7203243b08 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -41,7 +41,7 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
  SPEED = quick

  # Build up our target list from the filtered list of ninja targets
-TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, 
$(ninja-targets)))
+TARGETS=$(patsubst tests/tcg/config-%.mak, %, $(wildcard 
tests/tcg/config-target.mak))

  # Per guest TCG tests
  BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
@@ -49,7 +49,7 @@ CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, 
$(TARGETS))
  RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))

  # Probe for the Docker Builds needed for each build
-$(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
+$(foreach PROBE_TARGET,$(TARGETS), 				\
  	$(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))

  $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if 
$(CONFIG_PLUGIN),test-plugins)


I'll test it and send it out.

Paolo


