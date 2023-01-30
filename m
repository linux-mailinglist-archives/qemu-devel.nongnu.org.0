Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E98680518
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:39:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLwK-0000BQ-M4; Sun, 29 Jan 2023 23:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLwH-00009A-Vf
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLwG-0004kL-ET
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053519;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ju2P0VWS7K6ZLFv7S+N/lsygtCtZWoNPmabZDL58enU=;
 b=HUBRd7D6AMLvmHjxlYI84GzAdFTukcPiUULTE7BheLcyoxQW6cAJuVzmjAqBfL8abOSL59
 dL5xOrzFY+oxCJHOl7zdHrofR/jyZ1q4Cx1ZlVgx9rrkGUSpmlmetwMzzJkY1H/ctMf87s
 PhYzVp013oeHgtLMIUEdUZjyytDjBPY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-540-GBU5eafFNEK_y3MCtLk92A-1; Sun, 29 Jan 2023 23:38:37 -0500
X-MC-Unique: GBU5eafFNEK_y3MCtLk92A-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so1777501wmb.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ju2P0VWS7K6ZLFv7S+N/lsygtCtZWoNPmabZDL58enU=;
 b=lYj06ZTLlKHX8gPO/HfDptU6Wik1idQAiMwsb5jg+wpenQtosv3cRCSvMtZSQRx1d/
 xbKGD89/hBZXCdARI3ghg8oWGMTfXjQtCRwzya4FOSZbLbOk55PS3T7JZlRb6JG2W2iZ
 kuqjrd2Z10/djCbd/1SnapIiqx0/m5W4hfuecbGguXT1zipIyyqWSWGK+9wKO74u5a9L
 U3ESj1uSQxCXP56ix5+blNEJ/x7NQO/4k8VgjF3m1uHsav8doxmtzaWG12C/s2eNUCKX
 8PV57OJDAnL5y9JXmEYf+lDRAwGCh/3Y+0syMCFGHSZVqz77FrCAfo3AYL/2lK/adkCz
 KPfQ==
X-Gm-Message-State: AO0yUKWssFH4jf9qKgOfTa/aKVVhSTAnTEeZQ/qR0/f6YQiga/tMyywp
 2AVGf0OOfhwTuxa6v4EYavmKZc/pALw7wyMZgP37LaP4vXDHaOTxqt0y41u36UzND9I8xvxz1Ne
 ZfnazFczOUWc63gA=
X-Received: by 2002:a5d:668d:0:b0:2bf:d17c:609b with SMTP id
 l13-20020a5d668d000000b002bfd17c609bmr8745063wru.64.1675053516728; 
 Sun, 29 Jan 2023 20:38:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/SlGo3vYg77xpdBoDPU5jOr0X7xko2NLIv17/UtgBS1mh5uakMdgt+Rai4rDBFURR3FVSV9Q==
X-Received: by 2002:a5d:668d:0:b0:2bf:d17c:609b with SMTP id
 l13-20020a5d668d000000b002bfd17c609bmr8745051wru.64.1675053516516; 
 Sun, 29 Jan 2023 20:38:36 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u6-20020a5d4346000000b002bc84c55758sm12247508wrr.63.2023.01.29.20.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:38:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-stable@nongnu.org,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] migration: Fix migration crash when target psize larger
 than host
In-Reply-To: <20230120163147.2343050-1-peterx@redhat.com> (Peter Xu's message
 of "Fri, 20 Jan 2023 11:31:47 -0500")
References: <20230120163147.2343050-1-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:38:35 +0100
Message-ID: <87pmawmyb8.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Commit d9e474ea56 overlooked the case where the target psize is even larger
> than the host psize.  One example is Alpha has 8K page size and migration
> will start to crash the source QEMU when running Alpha migration on x86.
>
> Fix it by detecting that case and set host start/end just to cover the
> single page to be migrated.
>
> This will slightly optimize the common case where host psize equals to
> guest psize so we don't even need to do the roundups, but that's trivial.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1456
> Fixes: d9e474ea56 ("migration: Teach PSS about host page")
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


