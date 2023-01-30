Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DD680574
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMUM-0007hi-N2; Mon, 30 Jan 2023 00:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMUE-0007fc-JQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMUC-0001pn-Fw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675055622;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gyXjrDWleNg+uMKxyvRN/pj2dpCsyCtle7v9rizvDGg=;
 b=Tc7Kc5npmcLn8ypAAD/bI5xhrEpFlgFT9dsSDuLAcNxPMMG7rzRhcihoqniAL6j4ga3FDK
 uYDdDHe+QppQaFWuirTgK7m/42D7uEQoKapmSMcQED0cxi+Of3ikaE1Y6u9IyVK7MQE3BU
 nArxagpMvkq0BfFmsSymZ/ioaOyhwoU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-UCGYi8NIPb2PVl1Ok60E3Q-1; Mon, 30 Jan 2023 00:13:41 -0500
X-MC-Unique: UCGYi8NIPb2PVl1Ok60E3Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 l5-20020a1ced05000000b003db300f2e1cso3832328wmh.0
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyXjrDWleNg+uMKxyvRN/pj2dpCsyCtle7v9rizvDGg=;
 b=0FN/VooMIEW6Kv35tOrU3faLVgyEQdlZvg+Nx+GQE0ZWzK4OM+44szMZ7glMWrLlmi
 m4AG4C0Qm/WWFV8kjzrdQi0e9y0OZI+rBouecnK6WvNJC6SNM1rWKz/V/Uhf+dGepQhx
 jccL1TU+F5sCumql3j4AaFEQhwI7PrCH9toMiSJGR4DS+afWgy6MUblxnCyb+2F0axZO
 W/QoRPbk4pwhSZkT7UQ5jbZGgpY83Vc2Gsnmhq0Yic60pG8aYzhMbvcIaXq/G9n6m7N0
 N/DY1tIhXNMPxwriqxHOfkx5w8ODJW6fQSgNhsVOwPeUaMS8siECh1H61C+gSww18llz
 uR2w==
X-Gm-Message-State: AO0yUKXaY6Lkdpip0j1CUYulLA7ns/PGqRJOyR0fYv+vn9EJY3JJ3z3P
 ZuaPbgS45ntxZFpY5z5mPt5zP/V/4y75OeDu/2SDzQpHhQtsBPuGIY5HAZ6SrmN+wYJrYV5SILW
 QHjCtLcYu54+dlBw=
X-Received: by 2002:a05:600c:244:b0:3dc:5b79:2dbb with SMTP id
 4-20020a05600c024400b003dc5b792dbbmr881965wmj.25.1675055620112; 
 Sun, 29 Jan 2023 21:13:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/+4KbWswk1Oja8r6A+3Fq5nN142tttENtQHJxJWjKlTd+cqzddWMSueQg3B99McZ1+XE/4+g==
X-Received: by 2002:a05:600c:244:b0:3dc:5b79:2dbb with SMTP id
 4-20020a05600c024400b003dc5b792dbbmr881955wmj.25.1675055619907; 
 Sun, 29 Jan 2023 21:13:39 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003daf6e3bc2fsm23257523wmc.1.2023.01.29.21.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:13:36 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 11/21] migration: Add hugetlb-doublemap cap
In-Reply-To: <20230117220914.2062125-12-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:04 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-12-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:13:35 +0100
Message-ID: <87v8koiozk.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Add a new cap to allow mapping hugetlbfs backed RAMs in small page sizes.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> +bool migrate_hugetlb_doublemap(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP];
> +}

I think it was not our finest moment when we decided to name the
functions that query capabilities without a verb, but well, everything
else uses "this" convention, so ....


