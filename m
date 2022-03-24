Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DD4E6A42
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:33:07 +0100 (CET)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXV4s-0002Pm-Cu
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:33:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV42-0001V3-W8
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV41-0006VU-Ik
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648157532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZAK0+fVi8xDb2e2b6GksKw4kE5wjCBmsssRswPhhso=;
 b=W8HREYjRcbxQRGzv7+gtfjZaVlsnq8uYfdHQVEdauMmknPq6aDRlV1bTeOnmvlzvCHiWAt
 8DP+Xn8QoK6ClO+edKBt4NEnx0d+nTJLUxy4m/L2h/pwI3zPg1kl2kpKjhbpEI/pfFyGea
 LrsZvfe8Lp87tiv8KUiW7XmkGNL5Sqk=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-j4KNNqG2P0aLCtB5s8_JEw-1; Thu, 24 Mar 2022 17:32:11 -0400
X-MC-Unique: j4KNNqG2P0aLCtB5s8_JEw-1
Received: by mail-ua1-f71.google.com with SMTP id
 s13-20020a056130020d00b0034dfb85694dso1622812uac.2
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZAK0+fVi8xDb2e2b6GksKw4kE5wjCBmsssRswPhhso=;
 b=t01sNAvsSCWBJ9VSjd+Xw+SWVNIJLb53/nIO/qaeAqSVVjKOKe3/SLZIDUOQO8b7X7
 woRCNEZFfTZBQr4OsOzJ1aN33Itdk+IvVuat4uueFCIt0+5+ahbZBgrnnlh3jl+EEN/q
 AgE9M3mxn2Rh9Fa8qYQ6B0qQTPpVEK5tTjTUHijsNCowWe6SaRTKMfJSEJXuE52115cE
 gPxkWzPAG1PKacELXLanPf5FsG0OXd2reX9kKG1KGe3/kNqX+nmOlr3uK08HGOpOHTlm
 yeyyiROBKR21l0OCpT2XzbO7Co+qSjrUO62qtg2r0Dgz7RogLJ72wHdnhBkUaS2eDC3N
 H8fA==
X-Gm-Message-State: AOAM532dZukFMb2REBiB8VMXZk6vYk+UYgu4dqJWrtnbPp30umDXg/Z9
 PCEEiFy52Z5fb5CeHlJUJzDIgclO7ZgyegNw0zWfEIhi1D7SSXi3wsrW0Za1yH0LI+hnci00EUb
 xgcbQQnh7pwlebwEs0ZZj5f7nEdxxOLk=
X-Received: by 2002:ab0:5bc7:0:b0:351:aa7c:95d5 with SMTP id
 z7-20020ab05bc7000000b00351aa7c95d5mr3682091uae.42.1648157530685; 
 Thu, 24 Mar 2022 14:32:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBpWnVEEK5u+GR4zU214Uc5q439SAkjHaJZ5gNCpL9IaQWevPbUS/U1OvjT1lbB3llvaDkuEFxqbUj4XiI0Zo=
X-Received: by 2002:ab0:5bc7:0:b0:351:aa7c:95d5 with SMTP id
 z7-20020ab05bc7000000b00351aa7c95d5mr3682079uae.42.1648157530546; Thu, 24 Mar
 2022 14:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-15-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-15-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:31:59 -0400
Message-ID: <CAFn=p-ZJa5MBATOyzrnxXHcZ=qAV7HR09NVuuu7PKAFebcvutQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] qapi: fix example of dump-guest-memory
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> The member "paging" is not optional
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/dump.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/dump.json b/qapi/dump.json
> index d3ed79e8cd..0873f16e5c 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -83,7 +83,7 @@
>  # Example:
>  #
>  # -> { "execute": "dump-guest-memory",
> -#      "arguments": { "protocol": "fd:dump" } }
> +#      "arguments": { "paging": false, "protocol": "fd:dump" } }
>  # <- { "return": {} }
>  #
>  ##
> --
> 2.35.1
>

Assuming this is a feasible example.

Reviewed-by: John Snow <jsnow@redhat.com>


