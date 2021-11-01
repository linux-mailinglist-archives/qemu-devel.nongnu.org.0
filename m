Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD0442389
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:44:54 +0100 (CET)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhg2v-0001jN-Dc
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfpW-0004f4-Ic
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfpR-0006wS-Ec
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635805856;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LBISPzAKebzLYTIVnrtkSTH+mno1q36lJnkOAnM36A=;
 b=TNwYyQXg6Hv5zV1lijcuSHoGWGXd4phqy9/pmM6qsrIymADA/oIwhL/T3Jgf1G9TXb7BmC
 XdCfS4OAGP6SyV0i0BkOv/Z4Cx4UCqrCsVJ8Sctho5/sVxO8dtQxh+C78ATtAubnLJuryg
 uqZmoPhoSAGuloZmMPGe9CoSCIMejVU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-pYq9xq1qPDikZ8-LMeth3A-1; Mon, 01 Nov 2021 18:30:55 -0400
X-MC-Unique: pYq9xq1qPDikZ8-LMeth3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso2943471wrr.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LBISPzAKebzLYTIVnrtkSTH+mno1q36lJnkOAnM36A=;
 b=sh9cospBM1fKrgy3ndPhhzE8t+IDdMoIsRg/w93g01lHbV83LW5xEjsl6yWFJf300X
 jFz3tOBNMYt/d68zqQEmrShN5YwNqhQSlhMGspoqsP3f+7iwbdu0yI9lcd1ljFZbjy5m
 KnmxsCYUZbZsiBVkd8Y+PoJsV/ZbgMa1EUViyEuIUe1kiNpP7mSkPT1LFVF+IA3mne9v
 06JnHqlgzSttbOFRz/YfUiwHpLw7AvKcaZUNISS7bM9rmIG1BR9ZB2ZeutEag0On+ZXD
 zGwvREGwVHDXyHH85C+a1r2uIQnyRoQSPAl2f4Pr+UNbBG5d+tLonui25OVhZkoxL0dW
 lgTw==
X-Gm-Message-State: AOAM533XLzkJl8oRhULibtkgDupLJ8z0SYeZETvXusYvhtqA8WJqHHWS
 KkHM/uIWHrdZXhzSQYqFFFb9plujtfH0HM1rSbljshK81BZsnXv4lMNaO3rweQlYLfJhRXa4YU0
 D7pO+4oxR2HntdQk=
X-Received: by 2002:adf:e50b:: with SMTP id j11mr34572037wrm.430.1635805854248; 
 Mon, 01 Nov 2021 15:30:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv7Gy25eW7BjRHfBUuLtes2D2PxbuEyGzznrL83K0MIs6MMYMFcNPrX75pxqWlbjz7cynLDQ==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr34572016wrm.430.1635805854044; 
 Mon, 01 Nov 2021 15:30:54 -0700 (PDT)
Received: from localhost ([178.139.224.210])
 by smtp.gmail.com with ESMTPSA id r7sm7036075wrq.29.2021.11.01.15.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:30:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 1/2] memory: introduce total_dirty_pages to stat
 dirty pages
In-Reply-To: <43f4caeb051eb37f77099420cae2718194d40515.1626794163.git.huangy81@chinatelecom.cn>
 (huangy's message of "Tue, 20 Jul 2021 23:19:16 +0800")
References: <cover.1626794163.git.huangy81@chinatelecom.cn>
 <cover.1626794163.git.huangy81@chinatelecom.cn>
 <43f4caeb051eb37f77099420cae2718194d40515.1626794163.git.huangy81@chinatelecom.cn>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 23:30:52 +0100
Message-ID: <87h7cvqzj7.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> introduce global var total_dirty_pages to stat dirty pages
> along with memory_global_dirty_log_sync.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

Reviewed-by: Juan Quintela <quintela@redhat.com>


