Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F14E6A28
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:18:30 +0100 (CET)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUqj-0001SN-9Z
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:18:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUoj-0008DO-RK
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUoh-0003jV-8n
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648156581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tmYuhQsz8vM0BCkfjXRED2kBoVtno5AkZYGlL/CkPLc=;
 b=cr/ZjU4ITXFYgSqoE021sBWhItmLyJX578j1uf6qAIh36ofrdfjau15jVXHehbD1iAEjNd
 iTlGl3Z8e66+fFtdm5vRPCUZE44EKXhhdMwnkU6HkphICv8DZDetpt7LCVG7dTSS/gmh+o
 Far7lB//00D7vd4tmfy0p4+1cww51lw=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-LpEHU6v_NnWLfaGqyQoAjg-1; Thu, 24 Mar 2022 17:16:20 -0400
X-MC-Unique: LpEHU6v_NnWLfaGqyQoAjg-1
Received: by mail-vs1-f70.google.com with SMTP id
 c64-20020a671c43000000b00320a49afe2dso1232628vsc.22
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmYuhQsz8vM0BCkfjXRED2kBoVtno5AkZYGlL/CkPLc=;
 b=FHGMtRugz9gKymyIuiEoUwFyi0bPzBEZkk9oeOXGo5QaJPxA+JbuOCf7eRAFioZVU6
 qYHegp/+1AeY9ly3DP6MBjjcXUbiQme0tSmtPI1KhUW942GXh9lxnF6mJ/BPLhv771R3
 Hq/590EVMdRLlpYgYTKxaGo34JJFTryMVi9IOzUz2PWgiOu+h4+7A5KvmWkBJylC94ni
 eE9UdVDMg+5y3we4DMaxJxUYSFHzfVVBgWIpfZQ5ln8aeQkJh4e1bkhaG7moMK9AkvYe
 EXQpDtbucj5jQpgmurnok2HHicUzJqYZ1Vf/MtZYlO/Okpu8M+vF5ot/ykC+7EHHt8nh
 Kvlg==
X-Gm-Message-State: AOAM53275aOzMhV9s7q2qYAqypvXhXj/uP1CB/mIlmmq5ghjJazuejR+
 vRBCw/hDasDcE6WiKvCxaE5rMpo7gXiRuJ0nk3jZvNvr5ojRtJLcQ2fA6G9bd0x9DpKkTmZgawi
 6FO6w2GvQi1iE/GrpMsRkYomuqHiiTWc=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3421214vsx.61.1648156580014; 
 Thu, 24 Mar 2022 14:16:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbMGMiLiO8hroOWUFG0Y3bHKJZD1K27dpAw2K7jUX+wjp6VsSZyGqSRsGW1PYJTClX2CFD88hr8YzBk5m14ww=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3421207vsx.61.1648156579816; Thu, 24
 Mar 2022 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-11-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-11-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:16:09 -0400
Message-ID: <CAFn=p-aKJfgrSBSQaB6fn9kNQzGHwfP-JkTyBktkPB_LASpE=Q@mail.gmail.com>
Subject: Re: [PATCH 10/14] qapi: run-state examples: add missing timestamp
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
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/run-state.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 1b9f64c9cd..f87b9378ac 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -426,7 +426,8 @@
>  # Example:
>  #
>  # <- { "event": "GUEST_PANICKED",
> -#      "data": { "action": "pause" } }
> +#      "data": { "action": "pause" },
> +#      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
>  #
>  ##
>  { 'event': 'GUEST_PANICKED',
> @@ -446,7 +447,8 @@
>  # Example:
>  #
>  # <- { "event": "GUEST_CRASHLOADED",
> -#      "data": { "action": "run" } }
> +#      "data": { "action": "run" },
> +#      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
>  #
>  ##
>  { 'event': 'GUEST_CRASHLOADED',
> --
> 2.35.1
>

Someone once reviewed my documentation and noted that the timestamps
were correctly chronological.

... I feel like I have been *hurt* somehow.

Anyway:

Reviewed-by: John Snow <jsnow@redhat.com>


