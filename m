Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBB3281DB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:11:17 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkCa-0000F9-5F
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGkAs-0007RI-Mb
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGkAr-0000G5-14
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614611367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQT/c4bSl96nw1CD5TO3b1xfLXLAoR/0IbgklK74pZ4=;
 b=eyOC4xA9+DIgmyiW4/4t8o+Y94zhPRFPO6xvQ5vkLv3PjzKW7F4JSH5q1B+NZBTgqXw5ea
 xqC1p8WGsu5NoCITVTC5ni4FG2wtXB0l/atjW5FwOJJHMo3XYdBf6XxYG0neeYiOEDlfbo
 RiP6JdKaVFeqGOYHBnQIdcXpHkqm+T4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-1-G-7YPqM1mTqM1XMw3Qzw-1; Mon, 01 Mar 2021 10:09:23 -0500
X-MC-Unique: 1-G-7YPqM1mTqM1XMw3Qzw-1
Received: by mail-wr1-f71.google.com with SMTP id g2so2667579wrx.20
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 07:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQT/c4bSl96nw1CD5TO3b1xfLXLAoR/0IbgklK74pZ4=;
 b=JvFtAlafod5w2//cdc1jNmzZMX9Gw8MHZf6Hpyf1d44XLWTD9dhY0jaWtlRK2cL9za
 U+vDQKhl+jmhak+heoHhtmwozxq87LQEDVYWpMZ3SBbImLcEcZDo1DmVU8fktpGzUf/+
 +Bo7dg422CoacR504KUIOKlmB2GfEVRqmf9MgY9MMJzQtut82kERenYMhk++vItGM/Ba
 Kufqx+IFfBJYfVnMXr4Qfpiqxyzzg3PST8VBAKOvm999jZPH78mx4uQDUKZ7c2wPIgu4
 g6oUSqiQWSlhKNXQXQ4TrhZ4AX9kJT6y1M/lV85TGtlY5gBxTWZMqwTpX2qOs6XaYt1B
 nv9w==
X-Gm-Message-State: AOAM532z6501sVCj0Dv7YvGpspEFTYWBGO7IgmY1UzACFSbSyjtlQz0l
 jWhrOaPpMJJ1VoJOvRmzf0Zaq3pwyhqa5EHTAQDr3NOvA48EY0vsZBm+CoCxNtJljD2ALH8XCvw
 1N2i7MwDNQ55A8ew=
X-Received: by 2002:a05:600c:3550:: with SMTP id
 i16mr16180559wmq.170.1614611361910; 
 Mon, 01 Mar 2021 07:09:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT9O3H38oZSTdjU7+fZxZgzYLEz1DWgK5mcVPqLUk429sHj6CBGs8kuiYjfJ44TRQOuI8xMA==
X-Received: by 2002:a05:600c:3550:: with SMTP id
 i16mr16180522wmq.170.1614611361499; 
 Mon, 01 Mar 2021 07:09:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m17sm4787090wrx.92.2021.03.01.07.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 07:09:20 -0800 (PST)
Subject: Re: [PATCH] storage-daemon: include current command line option in
 the errors
To: Kevin Wolf <kwolf@redhat.com>
References: <20210226110312.157645-1-pbonzini@redhat.com>
 <20210301122638.GG7698@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d8b8217-d1d3-b7e9-c005-90ce4b2f8b1a@redhat.com>
Date: Mon, 1 Mar 2021 16:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301122638.GG7698@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 13:26, Kevin Wolf wrote:
> This save_index approach isn't perfect because getopt may skip
> non-option arguments and they will be included in the help text:
> 
>      $ build/storage-daemon/qemu-storage-daemon foo --object iothread
>      qemu-storage-daemon: foo --object iothread: Parameter 'id' is missing
> 
>      $ build/storage-daemon/qemu-storage-daemon foo --object iothread,id=t
>      qemu-storage-daemon: --object iothread,id=t foo: Unexpected argument: foo
> 
> However, without changing the interface of loc_set_cmdline(), getting
> the right index seems hard. Not sure what is the best way for fixing
> this or if it's worth the effort.

We can do better by passing "-hT:V" to getopt_long.  Then each 
non-option argument is returned directly, and everything works as 
getopt_long no longer needs to reorder argv.

Paolo


