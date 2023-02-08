Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218968F7E7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPpyy-0002Kj-0V; Wed, 08 Feb 2023 14:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpyr-0002KP-V4
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpyq-0004dY-1V
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675883977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NSVD/7iYXzVuGDiuaOK2ANfLNIt2t7TA71To6NNzPJ4=;
 b=LbE+Th2P+MSCe3BZ4eackRQ4uv/FnouHNLWLSC89p+CjKzfoqtIyhD/AWmoOikZ0mfEhWa
 ozXQgzzh38MwjTng9AVWWU5ujhmBh8C0IkKB83SceBkc1Kf5NLMe78iw0dhNOey8QZRgCw
 RRm92CCoWHhTCfMX4i51HTXlFwCYd+I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-6tS_MRvRPJC67nFZ1IQafQ-1; Wed, 08 Feb 2023 14:19:34 -0500
X-MC-Unique: 6tS_MRvRPJC67nFZ1IQafQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so1610639wmj.7
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSVD/7iYXzVuGDiuaOK2ANfLNIt2t7TA71To6NNzPJ4=;
 b=CtzEFOyV3FQZmordwkEhc3iCjIUe8JlpLAa+vDHNfVJWyWPIsfeWsRZyNXegESXUOj
 5bBVJxOfiFU1qhkIKXjdSMuib7El8L9cIzyvf4EMc7tBh1M+JhXHNFxbbaP9keBWNSJN
 u8/qVMrWytwCVn7qshElwq7L1h2eps5lsfoII4Qi2v4ko+B01cZK7NU0cszfJOe/UFOO
 lkdeMR2l6WMDpMlc3dAoZoLaRBlZJ2CtS1MMKB3UpsuMrW2zbyXX960k3Bz4RMzMvnrm
 vly3NmEjGB3aAWqULIYhkkA3ByFsAkf/kUnURpI0++c052/xGAfzGZbqYlqNyzk73DJ2
 +FcA==
X-Gm-Message-State: AO0yUKXSI2kfHXFoN7Vfk7m9/maLhEFGEIbThKaOtrz9V3cShFjvFb+b
 TbxaSD0eElqGz5vhptGCdMHTSgrh6AF08fA0N2FRqRnFE3/N0xK96DtOJwyAD6INYWq+RPjuqaw
 eJ4Mem5puqzgohas=
X-Received: by 2002:a05:600c:491c:b0:3d0:7fee:8a70 with SMTP id
 f28-20020a05600c491c00b003d07fee8a70mr10215182wmp.19.1675883973290; 
 Wed, 08 Feb 2023 11:19:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZJssFOhZj8KscIG2YNQmp0KuKuBuEfKdzWHcJGbSB8Klh0OLK66WNf1Fo8vUFh0EUW34azw==
X-Received: by 2002:a05:600c:491c:b0:3d0:7fee:8a70 with SMTP id
 f28-20020a05600c491c00b003d07fee8a70mr10215170wmp.19.1675883973090; 
 Wed, 08 Feb 2023 11:19:33 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm7355721wrt.108.2023.02.08.11.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:19:32 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v2 2/3] migration: Add a semaphore to count PONGs
In-Reply-To: <20230202212458.726496-3-peterx@redhat.com> (Peter Xu's message
 of "Thu, 2 Feb 2023 16:24:57 -0500")
References: <20230202212458.726496-1-peterx@redhat.com>
 <20230202212458.726496-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 20:19:31 +0100
Message-ID: <87lel89d8c.fsf@secure.mitica>
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
> This is mostly useless, but useful for us to know whether the main channel
> is correctly established without changing the migration protocol.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


