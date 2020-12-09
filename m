Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF02D401D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:40:46 +0100 (CET)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwtq-0005C4-0u
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwqa-0002f3-7r
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:37:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwqS-0007AC-LT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:37:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y23so1122423wmi.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U0TWIVHPQ7j4KXnKzm7OBKVxRoFmUdtxX4Qv8HQplTE=;
 b=DVZM/8srB8tXBiHH7NeCDnwPmrXKn0HKUYCxw0LoUdfTpfTu98IfbvCHvphILYl+EO
 pISxnEQeulileHqQzu4llI2hL8zreI7Tmf1TQTSw6qF8q0uQSMLdQvchiJsihAaPChwh
 +x1yoeEW3/yvSj9DR6vY85WJ5ZifrSEtD3w8Wv9GKLHMnC94Nids2cGxavISC1gq73Oq
 widZHJ8kKPJUWwICNfVxfUauH5MKKBTxSerKpKsivWhoC2Bg4pNFClh25PYuaj1DmRt/
 999Iau0w+v6P9sTl7Kjwt6Q0C6S4uzfBB69GdkX6FbQ+nltdxm2HL1lkKFV6BEu5XC/6
 3H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U0TWIVHPQ7j4KXnKzm7OBKVxRoFmUdtxX4Qv8HQplTE=;
 b=L1QMR/1h6FRUXh6C3wF2xjwMV9dX+k+xgW0JD6Rvzdpn2tQU6N0gS2D4mkoQ3zOPL+
 EzZ8lEWcY6LZrRhU+PhUO5FQKnQqoEJw8HnBb+TJJEg7zX9G1fy6ZuvjKhYnLQDcXJY1
 3dMyKXNlCl8COnlBCKxt82Pwz4JbqyAraTpcvlCGnZDTDkQ5dWjOUDBJU9kyFHcCXFwy
 0g67XifIxU9fNFUJCafCb6zB2kaGehzG+l6p6ai5EGxd/qflshXx2xf34BlJKn/95Vuj
 zmEstbWFbYSz9mEJhPDCqDOaB1Q6KJUSdAzv66NTQ/j2GPJ3nBZUeiIq4Fi+doyb8fY3
 i59A==
X-Gm-Message-State: AOAM531LPBtf2lBEIk5wH6OVPB72BmI0YyH8XKeILMKAxfBWIZAxpQ0X
 Nnf5uOQD7dGRfAj+xE+o+tygug==
X-Google-Smtp-Source: ABdhPJwfeetmVDmPm4dwAWv9vGZr+DGxmH4UlQ3GfO9o0pr7GdF6VHKei+cRJfVzae8pRLHIUfgbxA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr1996645wml.153.1607510232789; 
 Wed, 09 Dec 2020 02:37:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d187sm2734748wmd.8.2020.12.09.02.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:37:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD8EC1FF7E;
 Wed,  9 Dec 2020 10:37:10 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-14-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 13/32] tcg: Make CPUClass.debug_excp_handler optional
Date: Wed, 09 Dec 2020 10:37:05 +0000
In-reply-to: <20201208194839.31305-14-cfontana@suse.de>
Message-ID: <87tusve04p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

