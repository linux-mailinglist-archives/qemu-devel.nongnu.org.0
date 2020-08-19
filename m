Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527D249AA9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:44:13 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8LZk-0001Qw-2U
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k8LYX-0000xT-25
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:42:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k8LYQ-0002sB-Dg
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597833769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5le+NVoYEZoOj6S0s23X8W1dIquHC2Lc/K1l9mRcsE=;
 b=MuIATdYHrUg5nWkS/QOpIjLiDhwYhMeVnB9WDOXpmX3mOpFBMH+n6Op5rgyvO+vZ0DiISO
 B6ZBLNO5VduFfomFXG1yvqHB3j+7gjXiKChfCwAN/lFFvc40zlKNwHFwAAWPrd+4cYhvHh
 a2EgRiOj5h/udiCrElFlYa8ioPO22is=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-PayXdbPPMH2YFNysRIwUhw-1; Wed, 19 Aug 2020 06:42:47 -0400
X-MC-Unique: PayXdbPPMH2YFNysRIwUhw-1
Received: by mail-wm1-f72.google.com with SMTP id c184so620408wme.1
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 03:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5le+NVoYEZoOj6S0s23X8W1dIquHC2Lc/K1l9mRcsE=;
 b=heMZIqTOjTa6YxLdtuiI/xtDmVpNkDJMaDXTVmw/QPmNiSxuB64QqlkSlqdxWMPQzW
 X1A27W9+HmGId+24iFZbxtL2PaBU9cfeAsO5zqacs0VyRKBX17NlUcefjoQ/xR7Ngga4
 kFR9tvHNcEuSkceTnapW45RiCtzKJ9Hr6ZkeLZoLzVcgM7PmDQcRA5NiLpwg83C5lnME
 4p4utsaLuYbcyGIkgklcTlYJhynmoqC6wn13JQGvDcug5TixltAtxF0rz5dObJwhKTHX
 95MRIqmzVcBgolpKmd8oB9cUsCLUS/dNKdqVdzNwFwreCQDLSTZ7RU20oH50RlRF/vkq
 p8Cw==
X-Gm-Message-State: AOAM532FXeeIbF09/2RU0YLX7YlFNtIuNfBrcNJLKOs0hXZXQRmeu72B
 YNCB3YHUaqMU3xqpZ5MgZXRY6IjgJ7q/d9yzKwWwDaOiff7GTupEp1+8s9cHnGRolNYhZvm2bSt
 LjkExnJEQIkrg6po=
X-Received: by 2002:adf:f64f:: with SMTP id x15mr26083204wrp.180.1597833766258; 
 Wed, 19 Aug 2020 03:42:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNGK4Wb/2+LoUCkyxvOFU/4RsaY7cpGX/hXlhIm5JJL5Q3dgbQCyXwvPi5fCDQ8F/Nb9TJFg==
X-Received: by 2002:adf:f64f:: with SMTP id x15mr26083183wrp.180.1597833765964; 
 Wed, 19 Aug 2020 03:42:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1cc0:4e4e:f1a9:1745?
 ([2001:b07:6468:f312:1cc0:4e4e:f1a9:1745])
 by smtp.gmail.com with ESMTPSA id w10sm5282556wmk.0.2020.08.19.03.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 03:42:45 -0700 (PDT)
Subject: Re: [PATCH] tests: docker: support mxe-based mingw builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200819080206.27423-1-pbonzini@redhat.com>
 <20200819082013.GB69261@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a83d1d0d-3f5e-8aa1-801a-aaf844c29587@redhat.com>
Date: Wed, 19 Aug 2020 12:42:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200819082013.GB69261@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/08/20 10:20, Daniel P. Berrangé wrote:
> We already have docker containers with MXE based on Debian:
> 
>   debian-win32-cross.docker
>   debian-win64-cross.docker
> 
> your image uses a different naming convention, and puts both
> 32 and 64 bit in the same image.

Yeah, that's what test-mingw expects.

> I feel like we should have the Ubuntu variant follow the same
> structure and naming as the Debian variant for consistency.

My patch follows the Fedora variant, so that test-mingw runs.  That
ensures that NSIS is covered as well.  One possibility could be:

- create fedora-win*-cross dockerfiles

- add ENV FEATURES $FEATURES mingw to the win*-cross dockerfiles

- look for the feature in test-full and test-quick, and run "make
installer" if so.

- drop test-mingw completely, and adjust Patchew to use
docker-test-quick@fedora-win{32,64}-cross instead

Paolo


