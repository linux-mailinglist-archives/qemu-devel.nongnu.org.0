Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EC4862FA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:35:28 +0100 (CET)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Q7D-0007RW-7j
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:35:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5Pg4-0007n9-RU
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:07:24 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:40392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5Pg3-00038C-5c
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:07:24 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2E081F37D;
 Thu,  6 Jan 2022 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641463641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCevC7f4VSIKyQOhY3Sc8axNVvEPfbZSZoBkPYCW+Yo=;
 b=g+1xhiSxLPXO8NeGuuxLKkX+vlcUs/kPX7xgs6jJSKcrVFtqJqUM/fDqzGL5OOgWln4Fuu
 LqqJ807O9zV/TjnU/fNcZQaUMNj5t85hHv+8PBnO0f3OtV0RwT/urYTeyoyz+mDWfcO9bw
 pghJb3/zybU85QzF8r/FQjtjrYRjW6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641463641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCevC7f4VSIKyQOhY3Sc8axNVvEPfbZSZoBkPYCW+Yo=;
 b=j+zj5fet0/9kdyjSJh9pX5W4WbHlBzlDrVoZeC3vBeOTpO0FAAnKdqCQTGYyZPXVxRnPeY
 ZYTfT3wZkG4RqTAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9C2513C1E;
 Thu,  6 Jan 2022 10:07:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y0SuK1m/1mFieAAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 06 Jan 2022 10:07:21 +0000
Subject: Re: [PATCH 1/2] multifd: cleanup the function multifd_channel_connect
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
References: <20211222113049.9326-1-lizhang@suse.de>
 <20211222113049.9326-2-lizhang@suse.de>
From: Li Zhang <lizhang@suse.de>
Message-ID: <967884e2-4678-9f64-42ab-18edc4835f96@suse.de>
Date: Thu, 6 Jan 2022 11:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211222113049.9326-2-lizhang@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ping

On 12/22/21 12:30 PM, Li Zhang wrote:
> Cleanup multifd_channel_connect
> 
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>   migration/multifd.c | 49 ++++++++++++++++++++++-----------------------
>   1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 212be1ed04..4ec40739e0 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -801,33 +801,32 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>       trace_multifd_set_outgoing_channel(
>           ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
>   
> -    if (!error) {
> -        if (s->parameters.tls_creds &&
> -            *s->parameters.tls_creds &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> -            multifd_tls_channel_connect(p, ioc, &error);
> -            if (!error) {
> -                /*
> -                 * tls_channel_connect will call back to this
> -                 * function after the TLS handshake,
> -                 * so we mustn't call multifd_send_thread until then
> -                 */
> -                return true;
> -            } else {
> -                return false;
> -            }
> -        } else {
> -            migration_ioc_register_yank(ioc);
> -            p->registered_yank = true;
> -            p->c = ioc;
> -            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
> -                                   QEMU_THREAD_JOINABLE);
> -       }
> -       return true;
> +    if (error) {
> +        return false;
>       }
>   
> -    return false;
> +    if (s->parameters.tls_creds &&
> +        *s->parameters.tls_creds &&
> +        !object_dynamic_cast(OBJECT(ioc),
> +                             TYPE_QIO_CHANNEL_TLS)) {
> +        multifd_tls_channel_connect(p, ioc, &error);
> +        if (error) {
> +            return false;
> +        }
> +        /*
> +         * tls_channel_connect will call back to this
> +         * function after the TLS handshake,
> +         * so we mustn't call multifd_send_thread until then
> +         */
> +        return true;
> +    } else {
> +        migration_ioc_register_yank(ioc);
> +        p->registered_yank = true;
> +        p->c = ioc;
> +        qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
> +                               QEMU_THREAD_JOINABLE);
> +    }
> +    return true;
>   }
>   
>   static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
> 


