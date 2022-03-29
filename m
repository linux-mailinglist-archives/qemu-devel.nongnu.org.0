Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C34EB1C0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:23:12 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEch-0000ux-EH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:23:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEb1-000085-66
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEaw-00012S-5V
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648570880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZaBe7DiyRTLxzkky2IS+4I+/j/PcEf2CBZr7kL/gCg=;
 b=MhfmqdLIVNnlJnVLJY8HE5EeHa+/FCNlbhorqpM42bJHdC4yr2e+dwwbCUX5qZDUpFC0G8
 dmqJ5xTAv/9t0+w9sx/pQPiP5XxiXtB+Re2Dpt+53B+yNvjNLe0uxWk+6rUSKb+z1kh0DD
 ZiEbfaR6lwyBm8tBHmyWOIE3gmy0sss=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-Nh2Tv5j9MxS22luv_ysldQ-1; Tue, 29 Mar 2022 12:21:19 -0400
X-MC-Unique: Nh2Tv5j9MxS22luv_ysldQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 i24-20020ab00d98000000b00355f6d91f0aso6441404uak.6
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZaBe7DiyRTLxzkky2IS+4I+/j/PcEf2CBZr7kL/gCg=;
 b=AytOUlQO32wlcBK6QmhTi1OjM2SP64HjM/LfkC5YyhxSNqOzp3JQHeI/kFWn044ipY
 BiZK/qhM2GyfOU70d8Jg4DGqJZianJ/tV0iD/+0kVFE6Mt4nHK6eqIODbFlD+W5GZv1M
 v4KEXef9RE3dmYFS+Y9mhDYG5nbnOgTzbnwPGRCwoblZDrt5K/EkZCjLSBBmqt0GQ08Z
 sel+FFktnMt8g0hDQvTE4rfT7QOukSZUbH00tsgJHjIrhR85RIKMu9aPPI87hWT3z0Dt
 rE8MwNMYokYaA+5252k49FVfNyr5RKVOQFSutO+FAo6wX9lgVASW8xnqv6L7EW6LVxvy
 EAGw==
X-Gm-Message-State: AOAM531qmjTbcWlCgxlgtxZ/K2ibMdVuvA4FhjOxtgKYDvSXBGUssI6T
 G8f6vdy6cYDDu8mQ4UhsCL8Ggk1cblBw0TspmX+7fBlcqBjzvpdJzqjHbgJc2zZlvt45gBezvg3
 4UWS2R6xcyN5awTLESya5taKCCiYOOyk=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr17104781vse.61.1648570878737; 
 Tue, 29 Mar 2022 09:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT/lMhN4n8crK8xE6Wz0uBc8Xkge3C/fqZETz6BYhb4RgXtHHg67YitcQgvqhVDfKbsPdcQUjMkksKucXzbaE=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr17104765vse.61.1648570878590; Tue, 29
 Mar 2022 09:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220325221605.53995-1-victortoso@redhat.com>
In-Reply-To: <20220325221605.53995-1-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Mar 2022 12:21:07 -0400
Message-ID: <CAFn=p-ZNEffRWVh=gnP8f9mBTKq9Ug+ez67qovWZ2+i77fG_rQ@mail.gmail.com>
Subject: Re: [PATCH] schemas: add missing vim modeline
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Mar 25, 2022 at 6:16 PM Victor Toso <victortoso@redhat.com> wrote:
>
> This is the last qapi schema that is missing the modeline.
> Fixes 7e7237cd2b "schemas: add missing vim modeline"
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/pragma.json | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index 3bc0335d1f..e6a021c19c 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -1,3 +1,6 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +
>  { 'pragma': { 'doc-required': true } }
>
>  # Whitelists to permit QAPI rule violations; think twice before you
> --
> 2.35.1
>

Reviewed-by: John Snow <jsnow@redhat.com>

thanks!


