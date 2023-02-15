Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A73697BF0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSH1I-0000Be-ST; Wed, 15 Feb 2023 07:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSH1G-0000BB-Hn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:36:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSH1F-00028U-1I
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676464576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=i/fFVsocWr2QPhNqis/iaT/JUgbf8u12gWqYyYrcXG/Kky62NYn6+fvfJk1X8xAvwQ0lN6
 0chx+6IZosIUgjxuH/Us0dvE8/4AhWffdBlw/K82E9k9Hwx/FQoZ6wInk0SNrbqOcII8tN
 La+5hmtDyBX7PbXCRC7iJEoLblRteiY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-KM0upE2tOmmkmAiJbV6F5Q-1; Wed, 15 Feb 2023 07:36:14 -0500
X-MC-Unique: KM0upE2tOmmkmAiJbV6F5Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 g42-20020a056402322a00b004acbf564d75so6940624eda.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=w7CHd0V9XWNc7BBLb9fZU0gFP+w47Kmf1KQshTVwXZWmWSh6PEzX9a45HIyqmIpDFt
 7IFPv3qgEuZSt41KrcAVGQrs4tKNWpyys6y1vCi6KfaqoE8wOZi1OaqQCrbadyb6bDOG
 0gMocj8C8pjdOZujgmdYPUYjQU5hMY7rJGVbhRnkYAkggI8YZ7Ic+mbpE8vIJuEhTqLB
 GwMjW873qL4eUAKhYTLSgLHfp8PmBC/bofiPNh3iA/cbnxfI73qBb/BUsiF1oTgHwqkT
 auYfchWgHP+vzio9TnkotB6ydtXmgfcDoaRJAXD1Ud5Jic9Ci56cRRhGhrslVCfblEs4
 IG8w==
X-Gm-Message-State: AO0yUKVQoA8VuwaCLoKCmxGf1NcyqO21yb4GU3u1/lO9lR3jg5yYFs7X
 gaNjSSykLoW+3vLX8L3uXMaXjBpGFf7a+zvcnh7WIX6V5kH3dH8v0A3S4T0vn+LkArbuC2JpukU
 o+ynG5GgtHWOdAKk=
X-Received: by 2002:a17:906:9c88:b0:8af:2107:6ce5 with SMTP id
 fj8-20020a1709069c8800b008af21076ce5mr2008833ejc.35.1676464573517; 
 Wed, 15 Feb 2023 04:36:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/0jzXLj/w4Fjl+kv7Z8kwhimGduPf3f4SkamXXjGkw2CZ2vdI/HcGRetPiVVIFNSk1s0oO5w==
X-Received: by 2002:a17:906:9c88:b0:8af:2107:6ce5 with SMTP id
 fj8-20020a1709069c8800b008af21076ce5mr2008809ejc.35.1676464573171; 
 Wed, 15 Feb 2023 04:36:13 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a170906408300b0087ba1ed4a58sm9644234ejj.191.2023.02.15.04.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:36:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: TaiseiIto <taisei1212@outlook.jp>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, richard.henderson@linaro.org
Subject: Re: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack
 in 'g' packets.
Date: Wed, 15 Feb 2023 13:36:10 +0100
Message-Id: <20230215123610.117340-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Queued, thanks.

Paolo


