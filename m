Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CBC68E1E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUaV-0005mK-HO; Tue, 07 Feb 2023 15:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPUaS-0005iw-KN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPUaQ-0002IB-Le
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675801745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egWwlawFq60BjEIe83kCE72VD87SGzTDvNqDQftr6+c=;
 b=HoutGGS4OyZdSSKvVQIwK4SeLCdOWevKIq4uqFyovTwiw+NIRZeVXow8qhgwKam/2UtE4h
 16jM6pAaT3N0HFx5QPn5IAbnwtRg40D7qwbAYeYYySvgP8EFd2Fpjk9KBairlZx8xaUQJu
 ohKz/uygyNQKymrFyFI2gUUdIxK1Pss=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-gBoGVOJxMpWWsTOKeAs3iw-1; Tue, 07 Feb 2023 15:29:03 -0500
X-MC-Unique: gBoGVOJxMpWWsTOKeAs3iw-1
Received: by mail-pl1-f199.google.com with SMTP id
 t11-20020a1709028c8b00b00199404808b9so99077plo.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egWwlawFq60BjEIe83kCE72VD87SGzTDvNqDQftr6+c=;
 b=p8fVJx12wzYBF9aEvMm3XdvGX/UpGkJu9ubkxyvNNvkhgA3g73DFV2khHyqsHitfJK
 p5w8rwBWRa52D++lGh5RLFizQugfRljtHATFuvy6DY8lvMndsygbdkq5dracLfcRBf2T
 acCnhzGQzS0FxEf4BE81HHKf37L74G0ams/DsS/ivXJBSxhErX6+4MHfqQOPzShZ0Gak
 gOy7LqzDYs5jCeqF4PVI072n3kGmR9U2hMeznqWPhKA8FdcdalzugW9+XgAijDtM1uC0
 LqqUZDlNyWwhsoqHp/IiP9WiN77UxlnUbDMu1NkH3e0mt2Sk2Qstg7Aob0wpsSZwEL8w
 arqA==
X-Gm-Message-State: AO0yUKXR9u4h4h5d1yS+A6tCVqvtfcpRhq9coXEkttvijyo8oHCXtcGd
 ChAcXffjLLWtlJ7x7nLCPNhKDuXprH9UkHwgV8ojMUrE6/kGhNyETBqoluSO1pqcPoJXvuE+SCX
 S9iA7UM0Dc3aPCYAITjAWwW3O4ww07W0=
X-Received: by 2002:a05:6a00:2495:b0:5a8:16b7:c9d7 with SMTP id
 c21-20020a056a00249500b005a816b7c9d7mr368517pfv.31.1675801742321; 
 Tue, 07 Feb 2023 12:29:02 -0800 (PST)
X-Google-Smtp-Source: AK7set97qNCml+IbbXPaSeO6MU9+LygET9xAiDeMDsTtOheDgLK+fUTet0tD1ohL5VRomeKREvF0aTGNbWpzwvHqDvo=
X-Received: by 2002:a05:6a00:2495:b0:5a8:16b7:c9d7 with SMTP id
 c21-20020a056a00249500b005a816b7c9d7mr368509pfv.31.1675801741984; Tue, 07 Feb
 2023 12:29:01 -0800 (PST)
MIME-Version: 1.0
References: <1675796605-235646-1-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1675796605-235646-1-git-send-email-steven.sistare@oracle.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 7 Feb 2023 15:28:50 -0500
Message-ID: <CAFn=p-ZCA42VAMEkg8xQeTQBTMqn1AA7RjptkWD72uwBX+iKPA@mail.gmail.com>
Subject: Re: [PATCH V2] python/machine: QEMUMachine reopen_qmp_connection
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 7, 2023 at 2:03 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>
> Provide reopen_qmp_connection() to reopen a closed monitor connection.
> This will be needed by cpr, because qemu exec closes the monitor socket.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index ef94dcf..557209a 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -501,6 +501,16 @@ def _close_qmp_connection(self) -> None:
>          finally:
>              self._qmp_connection = None
>
> +    def reopen_qmp_connection(self) -> None:
> +        """Close and re-open the QMP connection."""
> +        self._close_qmp_connection()
> +        self._qmp_connection = QEMUMonitorProtocol(
> +            self._monitor_address,
> +            server=True,
> +            nickname=self._name
> +        )
> +        self._qmp.accept(self._qmp_timer)
> +
>      def _early_cleanup(self) -> None:
>          """
>          Perform any cleanup that needs to happen before the VM exits.
> --
> 1.8.3.1
>

This code is still mechanically fine as far as I can tell, but I lost
the plot on why it's needed - Can you please elaborate for me on what
you mean by "qemu exec will close the socket"?

(R-B still stands, but since I am rewriting machine.py to be natively
async, I should be aware of your new use case.)

--js


