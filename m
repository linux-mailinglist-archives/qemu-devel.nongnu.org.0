Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5464A9BF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:50:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qfb-0001SQ-H3; Mon, 12 Dec 2022 16:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p4qfZ-0001SG-3Y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p4qfX-0000m7-Ll
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670881742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wx/mQfO2KpEUfHp3hoN+OV+eCnjirgbjhQZ56nI0fHI=;
 b=A8aMnrvukLZqwQ9F7auRvAvkw68CjkovwowR7wH0OBCFm37AmfxskHCXulpXA7FomRr76F
 /9GmZgrOFyjVjvfv7QDD05ZMOx/urnHKBwXYNTQsOw+gkp/pTX4wo9h7ZZnx3zpQEJnQVp
 5d+U0i5u3EAoCqNUC2Ei6QGC6BheUZQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-502-pQIVvnooMemNH-gYqcBTMA-1; Mon, 12 Dec 2022 16:49:01 -0500
X-MC-Unique: pQIVvnooMemNH-gYqcBTMA-1
Received: by mail-qt1-f199.google.com with SMTP id
 cm12-20020a05622a250c00b003a521f66e8eso12797555qtb.17
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wx/mQfO2KpEUfHp3hoN+OV+eCnjirgbjhQZ56nI0fHI=;
 b=3NrWfTxXK1M3e9EnaWa1MTUm6x5LiBiuZR1/+HJv1Z9UO1FOBHxVcb6tiyVfAKetiG
 OxNfSOURlEEcfGwVDrzkF1dxi7bMwgkv/zBFtw+zp6Knzad1LOgTix+EuIcqtP1nVjNR
 bl9JHp/Mou+Dy7hUIWeizFiJia4TTjXbd7Ol7YdIZogfkzZ+XlJc9S3sh2DxGbuoijHD
 LqoPKrfVIhA5aEosQ/GYPCAZ3uc8pZQICbhxOLnzEc3v/5Cpdn2P59SJSdx7Segwh2kJ
 ybNDqqueDtQSDudnpFQZNGZ4+u/eRCxBzbQLLaKKAnaPQt2ziJndGCm8WRF9MLgCzY/a
 qG2Q==
X-Gm-Message-State: ANoB5pm4xV0bRzlakDzSFt+43BF5+oH2Enw1mWcGxx5G5j8quusxxiph
 37lBq+cd1sdWi3bjE/I3byNt0XYjYDY3kiSwLZhUCX+uxSgfm9GVKNMcOnssYuC/q3pmskvdvik
 P3RRjdsRlaMsD7ws=
X-Received: by 2002:a05:622a:1e92:b0:3a4:fb8e:f819 with SMTP id
 bz18-20020a05622a1e9200b003a4fb8ef819mr26147368qtb.52.1670881741123; 
 Mon, 12 Dec 2022 13:49:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7yP22ZRI1Rdg6oq9YOGV88F95LtSRi0vnRMFhHmS35/NZ0uf50+LjvQjo/bN5qJICJ8Jj0IA==
X-Received: by 2002:a05:622a:1e92:b0:3a4:fb8e:f819 with SMTP id
 bz18-20020a05622a1e9200b003a4fb8ef819mr26147342qtb.52.1670881740927; 
 Mon, 12 Dec 2022 13:49:00 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 u22-20020ac87516000000b003a6947863e1sm6465207qtq.11.2022.12.12.13.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 13:49:00 -0800 (PST)
Date: Mon, 12 Dec 2022 16:48:58 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH RESEND v3 07/10] migration: Refactor auto-converge
 capability logic
Message-ID: <Y5ehyl4k50QKr30h@x1n>
References: <cover.1670087275.git.huangy81@chinatelecom.cn>
 <b856c56e59904aa947f7a13ebae5e8f527c15fc9.1670087276.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b856c56e59904aa947f7a13ebae5e8f527c15fc9.1670087276.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Sun, Dec 04, 2022 at 01:09:10AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Check if block migration is running before throttling
> guest down in auto-converge way.
> 
> Note that this modification is kind of like code clean,
> because block migration does not depend on auto-converge
> capability, so the order of checks can be adjusted.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


