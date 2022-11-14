Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD63628EE0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:05:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinP-0007d5-SB; Mon, 14 Nov 2022 18:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif7-0004K8-RE
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oub3f-0005tF-2g
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668438453;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SZx96w5KTHbNUjt4Uf3tLWUD1dxtmWXFCsDVmfXSxWk=;
 b=btwGyzKEByS8M2/Wv7ZFOpNdRADyRxJHSTu0w3xPdRm9Fi5fCzF6cJK2wPrMt0lR95yA6a
 BkF/W8EEXvy2pHtIHz4PeQiNlz7O3fbejKmjR1vRQeOCb9uUWGLo6bEcAl/hlCz3Y8+9aW
 6bLhXqbS5o0G8mWwrtbqIg/s+TDmTvw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-12Qw54xbN7Wcgcs5EgZo_Q-1; Mon, 14 Nov 2022 10:07:23 -0500
X-MC-Unique: 12Qw54xbN7Wcgcs5EgZo_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r4-20020adfbb04000000b00236639438e9so2119522wrg.11
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZx96w5KTHbNUjt4Uf3tLWUD1dxtmWXFCsDVmfXSxWk=;
 b=JHlpQb4T5dUFrRZCMLTVraJOu37SyoX0cF+pUDwNiG8ywaQK4kCUDsO9qPPgDny65M
 FDJ+v0XoG7z6Y8ISWlqma58oAkG3JuYAIipU47pGxLDBUL+nxx3wtJcK8+8BD9eGc/ky
 87xddISisutmnunrRyh8ErWXuXKpJ38A7MkvxgCj23z/wZJR3y7sty+LHiavsiW8nwyj
 QeV6OVwC+pXQlDqlzJqZ06v5glhkEMqJeLDYVR3Y8qKsDAEnN0QZP9kBVmPvYjUEJLjM
 hAHhYhWfPCvwR+lMTLHl/mNJMF0A27ek5pxsuns1oa/Up+SDs6tmaAQS4szFfzipAepC
 d66A==
X-Gm-Message-State: ANoB5plgu/8IkXAJQaVWLJGdtgEhz2PBrMUWJ9h4gcxIZtWr1wrJELx4
 +yox6sPrqasBVLgY0cyr05Hy6yfTxIyGG13jtPVYIgFrHnWOkXIqVfBZPXlT7Sl9s7XyXBpJq72
 Vyz4ao/k3upshUvs=
X-Received: by 2002:a05:6000:511:b0:236:64ce:2c0a with SMTP id
 a17-20020a056000051100b0023664ce2c0amr7844138wrf.230.1668438441996; 
 Mon, 14 Nov 2022 07:07:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jzfr7oGOUgObe/8OCDV+tn6kWALI4FEdHS+VXKGvBxpVDaiuu2NQ9AcHgiM3Zf5Y7XXfnUw==
X-Received: by 2002:a05:6000:511:b0:236:64ce:2c0a with SMTP id
 a17-20020a056000051100b0023664ce2c0amr7844123wrf.230.1668438441764; 
 Mon, 14 Nov 2022 07:07:21 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003cf7292c553sm12386948wmb.13.2022.11.14.07.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:07:21 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 02/15] migration: Add postcopy_preempt_active()
In-Reply-To: <20221011215559.602584-3-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:46 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:07:19 +0100
Message-ID: <87a64tbmmw.fsf@secure.mitica>
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
> Add the helper to show that postcopy preempt enabled, meanwhile active.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


