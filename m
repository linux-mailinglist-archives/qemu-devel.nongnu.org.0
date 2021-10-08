Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD2426F66
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 19:16:02 +0200 (CEST)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYtTV-00037c-Cx
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 13:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtRB-0002LD-B8
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtR8-0006d7-PP
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633713213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYjudHKE5MwrNWAf8qwD+HtLnWPjfk+ayqKekwTbQmc=;
 b=HOeQB4PtExy8eIDoPFzrH1tM+ZgRdbCGT55OIENc9e9mn3oeVozRaYr3c9K9JnuuqzDBYW
 1oM1csFiD4tJ4NXTSYzFnB00Vv2165tiX9yzAlnGWfrxQwkFf4Jbeyg7P/G3scUVFZUHSC
 z7trIDpSv9n30C3+CG7unH+N7TOLTJw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-NOumroKoO7SOQwC4MApTCw-1; Fri, 08 Oct 2021 13:13:19 -0400
X-MC-Unique: NOumroKoO7SOQwC4MApTCw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so4226090edl.17
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 10:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uYjudHKE5MwrNWAf8qwD+HtLnWPjfk+ayqKekwTbQmc=;
 b=oaWZompzuyd66zctNQGxqvlxdM2XFjy9pa4fb5EhnB2oOz8AgSoRhXQ2n05DL4cbiT
 xwcsfMeqhTAhTYnr/x0V2Lzpp1CIKG95+DoYxIa8AeMxLtmoxCsO07nese1BKhNncmM2
 pLPNK83V6lsDwfM08NN4H6ZsnwY0Ufjw539jve8o2x3oANaUVyxRV5NcbxdeCbcs0qWe
 fJ3AiDFwn+w5urxFXTk3hsW4IG5c++wP0VSkRFf7CZxj6ftTo6dEytrJuSotsvT7Rp+E
 4oGodCEKRRGdTO71CrhF8gk32tkTmTDNff+6B+PoJ8CUrnRJ/7++ebrvT4UqiBwoD2DY
 RflQ==
X-Gm-Message-State: AOAM531/sXbW1HOL3MlwiGgN8uFd4eVCdwE6qcPIR4vHr3yyg/lgKQoO
 QYqbJ73cnxbptLyx0l4aN6iTuc3GVzSj54HUMPzdB8b7UjAuBb7fXVxgx8m4kOALX/Dva8spNIm
 hWc8hG/zbvI94jp0=
X-Received: by 2002:a50:d98d:: with SMTP id w13mr16860037edj.51.1633713198830; 
 Fri, 08 Oct 2021 10:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK/w5tLvUE/o3qBlWPvWculmas605zCrkbMdaGLnGgb5lUXXf+z8iYEggUMVoEqbpQXarlDg==
X-Received: by 2002:a50:d98d:: with SMTP id w13mr16860010edj.51.1633713198651; 
 Fri, 08 Oct 2021 10:13:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id l13sm1272427eds.92.2021.10.08.10.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 10:13:18 -0700 (PDT)
Message-ID: <dd45c9c4-02b8-dfab-b7b0-f6d2346d4e70@redhat.com>
Date: Fri, 8 Oct 2021 19:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210928160232.432980-1-thuth@redhat.com>
 <87ee8v7mjq.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ee8v7mjq.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/21 14:01, Markus Armbruster wrote:
> Paolo, do you have something for QOM queued up already?  If not, I'm
> happy to take this through my tree.
> 

I don't but I have enough stuff that I'll be sending a pull request 
shortly.  So, queued, and while at it I also made memory-backend-epc 
depend on CONFIG_LINUX (more strictly it depends on CONFIG_SGX, which 
depends on CONFIG_KVM, which depends on CONFIG_LINUX; but the other two 
are target-dependent so we have to do with CONFIG_LINUX).

Paolo


