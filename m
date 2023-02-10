Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D2691F45
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:47:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSnl-0007T8-BE; Fri, 10 Feb 2023 07:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSnc-0007Sl-Gp
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSna-0005TV-TT
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676033201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IZo3wK8xgJC1T9YK8L9DdfqrUKybTeaNeiMijZHw+tQ=;
 b=AVDIJ9Z6fpsxfAoKJnK1HMHZE5DTJ+B/SmcHfEIQozKIgkmc5AFF/Abpt8IBLBn6DsHhJx
 TenPDJyKE9SdriFQyzAyMARACDRPM5Hy/0mtYhUI0Ln2Q2Ol4i9LJ2ADHbo8OJP8Jxp9NE
 o6AxLHRrwnRmWPAOGFzG1+Nq7Gdh088=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-z1qrhRbQOJ6bwcpvIKMX9w-1; Fri, 10 Feb 2023 07:46:40 -0500
X-MC-Unique: z1qrhRbQOJ6bwcpvIKMX9w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so2510200wms.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZo3wK8xgJC1T9YK8L9DdfqrUKybTeaNeiMijZHw+tQ=;
 b=bufZiWpd7cg0p47hyEnw+O6XAr8X37iHZ4VfX5l/P/QeBGHbkTjzmyN5ZF5pPZZLnR
 RFyzQG7gJke7dTpyR+Gx+lkPj6EE5nI29jkm9r6YAQz9B0Fy1n4sfCsmGyYIl0lD8ODT
 sU7sNIxOaAK7Ey7XbRdrrPJFboCN0bWCErdUziYazdJi2IHDvS49JfjAGzBI5lnsz/f5
 3fU6bqeQ0HKsb7mAhu34N+WUuIn3y33jr7xmpfRgV2JBcOJJc/N+5OGs9hCL71yUPU+d
 UrZElXZwHORFuhA3ZYxUFppSlsGBUxyoxsTvT0cyB5ka9op7fGiiT8FIXdPEV6Ks2YM9
 sXuw==
X-Gm-Message-State: AO0yUKXCYknmz5e9sIR8OUvYm4qta5PkzgZWXkJnYazaIXP/3RO/hYP0
 wi8fgu9ysWfe7wxsk0Ih8l5KWMT/q7GykfxYUJO/kBrEUjYOtAuknle8ulDDHDexPksMkcO+4y0
 DA5Xc2yLd1wnxOS0=
X-Received: by 2002:adf:d081:0:b0:2c3:e4f5:18a with SMTP id
 y1-20020adfd081000000b002c3e4f5018amr14304606wrh.33.1676033199248; 
 Fri, 10 Feb 2023 04:46:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+ktstPA2//IqzF77Tw4nWoFuB2/SdB2o3xzwOmSwCi0mt5dQx4XwX4m2Wi8Bas2JEsVB++DA==
X-Received: by 2002:adf:d081:0:b0:2c3:e4f5:18a with SMTP id
 y1-20020adfd081000000b002c3e4f5018amr14304594wrh.33.1676033199055; 
 Fri, 10 Feb 2023 04:46:39 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05600000c400b002c54737e908sm1899138wrx.91.2023.02.10.04.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:46:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/4] migration/multifd: Change multifd_load_cleanup()
 signature and usage
In-Reply-To: <20230210063630.532185-1-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 10 Feb 2023 03:36:28 -0300")
References: <20230210063630.532185-1-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 13:46:37 +0100
Message-ID: <87sffdhemq.fsf@secure.mitica>
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

Leonardo Bras <leobras@redhat.com> wrote:
> Since it's introduction in commit f986c3d256 ("migration: Create multifd
> migration threads"), multifd_load_cleanup() never returned any value
> different than 0, neither set up any error on errp.
>
> Even though, on process_incoming_migration_bh() an if clause uses it's
> return value to decide on setting autostart = false, which will never
> happen.
>
> In order to simplify the codebase, change multifd_load_cleanup() signature
> to 'void multifd_load_cleanup(void)', and for every usage remove error
> handling or decision made based on return value != 0.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


