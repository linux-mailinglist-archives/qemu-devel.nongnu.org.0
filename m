Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0E583B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:46:22 +0200 (CEST)
Received: from localhost ([::1]:53994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH05z-0007Gd-QV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oGzUT-0002Kz-FZ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oGzUP-0005pk-U6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658999241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/oJApOrDfrX4FQZuuQyx0no2eYW+qxMkaCfN7sK4t+A=;
 b=DuQdOl+7noQ7s+EBFgCgsY1b1XSmtGt2mHsYMRZECjL8scEXtNh4cdZy/17xGnhbw5KO/R
 u6zaL4bXx6XYnLsQWq9ZyGmiwzHlMOtOTWnEcWsfx46KVfvu+Nka5LzVYOmbg7wHRbC5P7
 rUtc7pyzXHN688gc19v7K8sZIXwaXcw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-fLfTUqKiNjOvD-DayqEaLA-1; Thu, 28 Jul 2022 05:07:19 -0400
X-MC-Unique: fLfTUqKiNjOvD-DayqEaLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 x5-20020adfbb45000000b0021ee56506dfso222614wrg.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 02:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/oJApOrDfrX4FQZuuQyx0no2eYW+qxMkaCfN7sK4t+A=;
 b=75W0P+rCUEzsgt6WreKfZdmaQJanHY49nIW/bg6w7kEGHIZdSpMbEnHICfbGnZrUSc
 vLtlzNqBgtq1fc4kefsmLTqizGj2UCh1rzXCnvEHZ4GvXmtbAj3yeKfYJYjZp0ffVtAL
 ZNFwxuREPJYLWfQSu2mztwfkSJDrJsR0hGZc9xpa4DH/y8L8qB4H7iYj6ZoMSQIRh2eU
 TfYVyJ5rwCd6T9/GJ7fUMgmOXyCWfbBGCA6jSq1xKuIfe4mQC3q2XmSJUminGPdUBcHl
 PsYGAL1d2zHhsNP0nTxyTrIaMoFJLcJQU1eIjn5uemDd3hIjzi218f/EFWoKct2vnYCY
 en1g==
X-Gm-Message-State: AJIora9I0Ris28VD8t3BZEyYmzm0yCO6d6jHpLdO544s04YgMSFedy+N
 PY7iszAujwMyIn1TG9S14/qkucClQuWDG+EitbWmoD+CZ0ZtTqqkkzn2+HBOtShtz3B7F40vPXO
 1e9jB85IfEHNaLb4=
X-Received: by 2002:a1c:4c0f:0:b0:3a3:1401:7660 with SMTP id
 z15-20020a1c4c0f000000b003a314017660mr5906290wmf.8.1658999238524; 
 Thu, 28 Jul 2022 02:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZ7DTsJPP++VD9nRaJf0jtqZevphb3gdFkoN+Nh7Biw39rRhKnxo4AI20dbz9+q/7ptxBi5w==
X-Received: by 2002:a1c:4c0f:0:b0:3a3:1401:7660 with SMTP id
 z15-20020a1c4c0f000000b003a314017660mr5906261wmf.8.1658999238178; 
 Thu, 28 Jul 2022 02:07:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4008000000b0021ed0202015sm445946wrp.10.2022.07.28.02.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 02:07:17 -0700 (PDT)
Date: Thu, 28 Jul 2022 10:07:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 4/5] migration: Make find_dirty_block() return a single
 parameter
Message-ID: <YuJRwjD+jbDXiGG4@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-5-quintela@redhat.com>
 <YsQ0fc67PKePt3rS@work-vm> <87sfmnderg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfmnderg.fsf@secure.mitica>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> We used to return two bools, just return a single int with the
> >> following meaning:
> >> 
> >> old return / again / new return
> >> false        false   0
> >> false        true    1
> >> true         true    2  /* We don't care about again at all */
> >
> > We shouldn't use magic numbers; if you want to return it in a single
> > value then it should be an enum so it is clear.
> 
> I need to also return an error in the following patches.
> I am not sure if it clearer to try to change to an enum.
> Will try and see.

Well even if you used a const or #define, it would be better than having
0/1/2 all over.

Dave

> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


