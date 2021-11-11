Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788244DAFE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:11:01 +0100 (CET)
Received: from localhost ([::1]:59934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDbI-0000bo-Od
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDXr-0005Xo-B8
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:07:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=35696
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDXp-0001mQ-Oz
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:07:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i5so10985215wrb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=iU8zjnpIjHwSbJPrwLzXjzgpyT4oQ6JBv0Cz3SA2cAI7W1V95HczaPwioK6ziyhiGG
 6jsY/CJTODEhBQ8kyGk6UvVytAkOtU2xmnOAIXYqIOySa8lIKRZC1QXg+MuK4HbWOqpf
 Z6nFXdPWoQkhN66ay+PorIjuOoV43CicehtFTrAZfUywEzlFdgY76Kpzdudqzt0CSMJI
 ZgD1twrCdmomLxiCDJYsLoDpjCt8+T5UfUZZmgCS6NCkXaum4I4jAFUfL9OW4d/gEYUJ
 7Dljg8wtt4hibJ1Y65Ls6h1NNBtPuGjVTpLS6cLMVdctvhOFd/gDBq//sw1EiHYOuHA5
 tBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=6Vve99dOfGUfnUKc/F725cl7KvERNlvVFBdrEAv8zxYkZZGICTo1RfbNakOr0IdvMn
 s+/VPkMd1knr1s38c2Kpd9+jLBmXZRF/KoVGoFB8kzR3YlS/2jbPvtFkjBLLSq0mslS6
 ulNF7AhnPdtlyoHS+Fkoj9ZKObL3gD11h41PunLx5EsAtEzjWpIBAG7+2qvaWkiMQoS/
 9negPAhUnCh/K2mTANspBfJhme4t2B6XV5bIqWfyc98hKdpBBW6+E2jKyfiSED4icsQc
 a1KGNexE6a85GwIPbSg0pNrUi99HEx0JRChET0whiC4lf0ZwdpWu6cJp7vGJEf/YSDU3
 Qwlw==
X-Gm-Message-State: AOAM533zsiQu7NDRtqThmSmwDkPcL8b4ef6jtloWWBZKcSacq5IaMpG2
 B2aibkVu8GUL/3jUlWNvoeoHVB+sYf3svA==
X-Google-Smtp-Source: ABdhPJymHZOon6/pNgXooD96AnpXneNZAd1Jzo26v7H/81aGpJd05bd959wVPK5cHqmPn5NTVR1Cpg==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr10697316wrx.315.1636650443212; 
 Thu, 11 Nov 2021 09:07:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k27sm10171018wms.41.2021.11.11.09.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:07:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9DD3D1FF96;
 Thu, 11 Nov 2021 17:07:21 +0000 (GMT)
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-3-pbonzini@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/5] linux-headers: update to 5.16-rc1
Date: Thu, 11 Nov 2021 17:07:13 +0000
In-reply-to: <20211111110604.207376-3-pbonzini@redhat.com>
Message-ID: <87czn6ipti.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cohuck@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

