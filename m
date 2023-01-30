Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC6C680551
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:01:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMI8-0000eL-ON; Mon, 30 Jan 2023 00:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMI4-0000e9-RV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMHx-0008Md-Jj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054863;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MLZTratPLrF2n7Wfl84cxjsSiSmfVSetQFdPikR0mTw=;
 b=N5QwsiKaRM3DLxUJkDjQBl1lH6LJNdV67rfOYC6MLshWryTOwespQW3Co/jIYoLSHX4UBZ
 VicNBO8jNwrs5GaSwKnduyFCHIDZqMjIYVBNcYGQDjwwjKhxsaHYZPORMKN+V99swScTSM
 9i8LJrGVxPNpZymHqxcwKNXoJyg4wQc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-vsu4Nx_vMvqqisJG00AP3w-1; Mon, 30 Jan 2023 00:01:00 -0500
X-MC-Unique: vsu4Nx_vMvqqisJG00AP3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so1855669wmj.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLZTratPLrF2n7Wfl84cxjsSiSmfVSetQFdPikR0mTw=;
 b=odGdqXe8PXkbvN3DXWrbwKtP7vnUUR1Xf2GTa7yq9XLzW+kiSqQHAmd+4y0f7Qv9Dd
 UnJ8kRB344WZuBMsnZU3cvBOqGmdQPImWPySn/HkmwKEvr0g4x8FabScJ9SKIMnslXeI
 GZYYCmp4/i26P0iXMdGdDgyykD4hkXOqrfGxSvV1tcUZFZfzr16nByhgmX2HIX+ArtEy
 W9V0ra4q1wB0l4nzjKIa+B9biIBqCPphzfyEbSj5CNtQy3Y5v7z4TOFyJmGluWNY2e2t
 QqTGcI9D05wEpTu3wSTqKuO1sEPrSJD6+Oz01JvKTClLqBnG6Ttp2qTF76cIGWOba5Ee
 5aqw==
X-Gm-Message-State: AFqh2kqNXVo4weydTwpJ+JzMTiK9tVEZzkxV0pix+/ppNLeM67ukeyYp
 DWysUkOMZw5hRY7mc9DowPl4AREHjX1M9ATUaPcOxQ0LKm5luSIStZM7rsls7uOngRESqHD7ThV
 kpVoOHXPpGBC3tS4=
X-Received: by 2002:a5d:6a47:0:b0:2be:64bb:1d84 with SMTP id
 t7-20020a5d6a47000000b002be64bb1d84mr28984934wrw.24.1675054859108; 
 Sun, 29 Jan 2023 21:00:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsJRdpYksVgIKqnbbceJNgemeR1XxEvhjCYGXX/8uHZj4eXBNIw8tlTioCk1BcP01INmLPboQ==
X-Received: by 2002:a5d:6a47:0:b0:2be:64bb:1d84 with SMTP id
 t7-20020a5d6a47000000b002be64bb1d84mr28984924wrw.24.1675054858866; 
 Sun, 29 Jan 2023 21:00:58 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k27-20020adfd23b000000b002bff1de8d4bsm648437wrh.49.2023.01.29.21.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:00:58 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 03/21] physmem: Add qemu_ram_is_hugetlb()
In-Reply-To: <20230117220914.2062125-4-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:08:56 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:00:57 +0100
Message-ID: <87tu08k452.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Returns true for a hugetlbfs mapping, false otherwise.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


