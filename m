Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A660F6D7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:10:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1ez-0002cb-1D; Thu, 27 Oct 2022 08:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oo1ev-0002LX-CS
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oo1es-0001Yv-QZ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666872409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyjjWgqrmAsqxa52pNkY2lNa6CwhU0oHn6V3WUAs0X4=;
 b=AFvEDaNzXEmPC8bZJEo/pQGLE0MmuMfoT76L5jRXrFBKGzlDZ58x5kdzDVPHFP3iGL729t
 Na6+N8dJmAmSCpI5BP5qufZaRUFeAmkbLWT5mXnF6vw9r3mZ2/j49RiMbMQ4ewyEyIe6of
 juGwG7ihOZW2jlvZ/0R5o9OwkkuUrP0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-Gx--wkVCNHOqI6q16tLaUg-1; Thu, 27 Oct 2022 08:06:47 -0400
X-MC-Unique: Gx--wkVCNHOqI6q16tLaUg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr26-20020a1709073f9a00b007a20c586f1eso900147ejc.20
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oyjjWgqrmAsqxa52pNkY2lNa6CwhU0oHn6V3WUAs0X4=;
 b=rXd/SOMkA0U+a3OIWeiQ+G9rIuvOiBKh35QKZSizvAk5JRzFIYRxwwVUW2i6hLpVsQ
 KtE3G+eHGUcrnspnu48QuSjEbCCI8D+qbRgqKb3jZVOITBfrQW7aNQJr7VWroc8qmJM6
 Vk8zqtdlFgGcfukU68Ef9sNNoHOAMa2BW9Dl0TFDuzLBlLErclodHLXrG2wz4ihuA11H
 Vnbs1yeQgwPGZ2FYrDGyE9+PxHeXSaimCGzV90PMcyhDtwyD2REMbgf0mldvpJIu4D/V
 6HlxtS/7IRdrmYuMTuaC4z6/XRtdb2il+3xPtTI5rRdUzRwXX2v5QgnWuD1ZcxdnRr6u
 1waA==
X-Gm-Message-State: ACrzQf1brPoY83i7T/rVyWDydT6F7CouGZ6F4oZwK7GnH01YhmAIu8Kc
 LspUoZ48mvTiJca6WmyP9hJ4tyVGj7IOpUIqcPKqZ0lelgaH34tjKA4o10muFur2XYwpzpxN5kK
 rjpnyu4nMfDhtR7Q=
X-Received: by 2002:a17:907:97c1:b0:791:98b8:9ab8 with SMTP id
 js1-20020a17090797c100b0079198b89ab8mr40943940ejc.425.1666872406495; 
 Thu, 27 Oct 2022 05:06:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72dCjQPCQIY2X5223OaUtfFZuZTTnyafLQn+In+QxPImS86o0UyZFeeHiSYo2lPK0D56dUYw==
X-Received: by 2002:a17:907:97c1:b0:791:98b8:9ab8 with SMTP id
 js1-20020a17090797c100b0079198b89ab8mr40943925ejc.425.1666872406350; 
 Thu, 27 Oct 2022 05:06:46 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 v5-20020aa7d9c5000000b004580862ffdbsm880056eds.59.2022.10.27.05.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 05:06:45 -0700 (PDT)
Message-ID: <b081a2f4-5dbe-ec8e-b4de-b9ba0d427453@redhat.com>
Date: Thu, 27 Oct 2022 14:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vl: change PID file path resolve error to warning
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, t.lamprecht@proxmox.com, d.csapak@proxmox.com
References: <20221027101443.118049-1-f.ebner@proxmox.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221027101443.118049-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27.10.22 12:14, Fiona Ebner wrote:
> Commit 85c4bf8aa6 ("vl: Unlink absolute PID file path") made it a
> critical error when the PID file path cannot be resolved. Before this
> commit, it was possible to invoke QEMU when the PID file was a file
> created with mkstemp that was already unlinked at the time of the
> invocation. There might be other similar scenarios.
>
> It should not be a critical error when the PID file unlink notifier
> can't be registered, because the path can't be resolved. Turn it into
> a warning instead.
>
> Fixes: 85c4bf8aa6 ("vl: Unlink absolute PID file path")
> Reported-by: Dominik Csapak <d.csapak@proxmox.com>
> Suggested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


