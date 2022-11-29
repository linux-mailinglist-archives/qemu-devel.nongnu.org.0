Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAA63C270
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01ZS-0001nA-D5; Tue, 29 Nov 2022 09:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p01ZR-0001n2-G4
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p01ZQ-0007Cd-6b
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669732007;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=D2OcN7PUq9hrhaiyG0cx6xSaET92khQ5Qnqsu4ELxMc=;
 b=QUAzp3ZFA2Jt8lmZCUvewjatzu3E5bgyqEyQRZyRAE+cfhcB+F+CWC5YshQR46kiE8Qi/f
 B+yGPlgzgIG9cTj1cMcn7IE+eCUtFR9xoO8bRm+iqG6/GNSuaXkZZtxhm6E8DoWYADJ48d
 C9Ayy2/aTfRz8rpiKwfEV5LEICla0oo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471--MzAgZjiOHmSlDD_8db2Bw-1; Tue, 29 Nov 2022 09:26:40 -0500
X-MC-Unique: -MzAgZjiOHmSlDD_8db2Bw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k1-20020adfb341000000b0024215e0f486so1611263wrd.21
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 06:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D2OcN7PUq9hrhaiyG0cx6xSaET92khQ5Qnqsu4ELxMc=;
 b=Gx2AJp505j4rTAL95E7waYCLVDp8AnMkpsAYA4dVClcRcVaUcpl3E0OIP4lxqY+9FH
 jJFgoX3BYp104Q4l0WQiQ3y9pelVxWYiPm8hgMfoWdpJR8B5Y+ngLLoQ6cKusNwVQDfQ
 gNsegT2M6BeqRbKoajaLy0l9j56HSQSuxWn4QtbObXUzlOfQa4DNas2HkZ18XBp89y4g
 0khlfszPALJw47sCqgGztAuFCKdz6vpUhZxx9aOjjRj1zs8B8G/onLhBXuijT6e7qnXO
 jXJHu6kGHoNYF1jr3hpKQJSe1OX4jVGwPWy/+P2mp0eCsmHLVVfBjUYGSHRlTsp4l9Y3
 2hcg==
X-Gm-Message-State: ANoB5plrv05ZT6LLry6O8/PLyZlZOaqmI+rGo5ASoJqME5AFVEuse3FN
 BhnHQuIJPjFtmmBqy6gg1dfujtLl4olV6AoJWUB7Mnn7L+jA/U4RfTAPtjPjp3Bztv7MoATvHgx
 o8jhbLBMr+hGo9lqvoBEtJwABY+OAg2IFUjpV3qf+dpAcBZYm9ekzrktfluCW+xYkIZM=
X-Received: by 2002:a05:6000:691:b0:241:b92b:d086 with SMTP id
 bo17-20020a056000069100b00241b92bd086mr35418027wrb.259.1669731998887; 
 Tue, 29 Nov 2022 06:26:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6kmpYUN3qnHrjevIDEaTxDQG0zIiY6I+WMZI2rOPxQ+6o/gtc5cpPQ45349ss9Al3m8AQCbA==
X-Received: by 2002:a05:6000:691:b0:241:b92b:d086 with SMTP id
 bo17-20020a056000069100b00241b92bd086mr35418005wrb.259.1669731998493; 
 Tue, 29 Nov 2022 06:26:38 -0800 (PST)
Received: from localhost ([31.4.242.201]) by smtp.gmail.com with ESMTPSA id
 n3-20020a1ca403000000b003d005aab31asm2057070wme.40.2022.11.29.06.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 06:26:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org,  Stefan Weil <sw@weilnetz.de>,  David Alan
 Gilbert <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] tests/qtest: Fix two format strings
In-Reply-To: <20221105115525.623059-1-sw@weilnetz.de> (Stefan Weil via's
 message of "Sat, 5 Nov 2022 12:55:25 +0100")
References: <20221105115525.623059-1-sw@weilnetz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 29 Nov 2022 15:26:36 +0100
Message-ID: <87r0xlltur.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Weil via <qemu-devel@nongnu.org> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued


