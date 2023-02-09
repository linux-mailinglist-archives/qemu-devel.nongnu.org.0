Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7732690FBA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 18:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQBBn-0000xl-ON; Thu, 09 Feb 2023 12:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQBBl-0000xJ-SV
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:58:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQBBk-0001Tm-B1
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675965507;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HOvKl24992JL9p3BDeHzRrDjv+QC8EU2k3xSLUYGuzE=;
 b=fAY2LdweQGqiVv1gF/LOrx1hlZljGiem4ElE8Jgvn/cICR94+raC9R/lYyeDS+5YQsdTNR
 95ke1VS7ah6cNi92SxgOOcn1mEJr2htjv9kiE8pQq7JS1tmEZaJa9k1SzZcXnEi2Px/TMx
 G3YqUqFB1G/m3ZrBopmGY++eybeKf/Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-WclFGt-rMbi0AHEpV7OwTg-1; Thu, 09 Feb 2023 12:58:25 -0500
X-MC-Unique: WclFGt-rMbi0AHEpV7OwTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bd21-20020a05600c1f1500b003dc5cb10dcfso1379201wmb.9
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 09:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOvKl24992JL9p3BDeHzRrDjv+QC8EU2k3xSLUYGuzE=;
 b=K4eCV/cQsBPO6rTloMvT3a/UlBGAOK3A6dHRciWpLqnSiFuI/zc2nRl1TNL5C2kpTg
 ctg+UsNo+TryAqzuAmBA6mVn+foldeRn+2AHs/Eqw2tS9rQOp7k7QSqo57SnUf8JL2Cs
 Ld9L0Vn/a1iaAXhJmO4wMARhELe5rGpwNnrIkd6vqsr4GsbwuWM0NGUd/yPZeY+ROuOZ
 i/kuGYImwV1KmrKhg4MNfiMLWtsfcRqdpNUh6BthC6tOS9eaSnqoJviFziDf3xHCkxmt
 ePL1Bw1DMQtTObNwAGPoqu1hPxFICeT09WEbQBDPit/hLe6UzzcD1iK0o3Vp9Zo8Tq3F
 HWvQ==
X-Gm-Message-State: AO0yUKXOifHe9TOdxR/FoKZFMiY3WsIZe9OZTU+znI8eo1wsztCNQq7t
 7siALjNuDFCOY/7YKFoaIkba6Ue4E/jHe1zcGkulK2IvsOn228t7HcNvG0eGDObnc0QVVing4tC
 x0VrjCxqR3SVn/Vs=
X-Received: by 2002:a05:600c:43d2:b0:3db:3e8:feca with SMTP id
 f18-20020a05600c43d200b003db03e8fecamr193974wmn.15.1675965504568; 
 Thu, 09 Feb 2023 09:58:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9c+r5jFFwyDMenlnRtmyycJYpzfLWT6qRUbMUvzSQuheZINkRC4foTrPWuwVv6ieeZJHk0mA==
X-Received: by 2002:a05:600c:43d2:b0:3db:3e8:feca with SMTP id
 f18-20020a05600c43d200b003db03e8fecamr193960wmn.15.1675965504340; 
 Thu, 09 Feb 2023 09:58:24 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 iv12-20020a05600c548c00b003dc521f336esm2871488wmb.14.2023.02.09.09.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 09:58:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  libvir-list@redhat.com,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH] hw/misc/sga: Remove the deprecated "sga" device
In-Reply-To: <20230209161540.1054669-1-thuth@redhat.com> (Thomas Huth's
 message of "Thu, 9 Feb 2023 17:15:40 +0100")
References: <20230209161540.1054669-1-thuth@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 18:58:23 +0100
Message-ID: <87v8ka3em8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> wrote:
> It's been deprecated since QEMU v6.2, so it should be OK to
> finally remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


