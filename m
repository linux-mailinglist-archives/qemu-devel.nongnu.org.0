Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3C329672
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:40:40 +0100 (CET)
Received: from localhost ([::1]:45754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyhz-0004Kf-SB
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGyfc-0003i2-6R
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGyfY-00030U-AO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614667087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qXEI06VKPZ8Rj6yEDw6JqwGnuV33op3r1hwjRSQasU=;
 b=N63Snj0hLUnU7aDWaObZoUkkrFfV/6n7TrkBqy7qNs8fmJ33jZOMmPALDAx4ehAOLcfM9/
 JueQint7ibqEtgMC4XdE9p8YwVisU2y0bRNu+CWKpEXrUof128QH2KfqvW/QjCqmKkzMHE
 R8InDLR+6NrwJLE9T/b6RTiNYHh/o2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-bv4HHjJ1MhOcpE9HcTfoag-1; Tue, 02 Mar 2021 01:38:05 -0500
X-MC-Unique: bv4HHjJ1MhOcpE9HcTfoag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DC49803F4F;
 Tue,  2 Mar 2021 06:38:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B51B10013C1;
 Tue,  2 Mar 2021 06:38:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91EB4113860F; Tue,  2 Mar 2021 07:38:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] storage-daemon: include current command line
 option in the errors
References: <20210301152844.291799-1-pbonzini@redhat.com>
 <20210301152844.291799-3-pbonzini@redhat.com>
Date: Tue, 02 Mar 2021 07:38:02 +0100
In-Reply-To: <20210301152844.291799-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 1 Mar 2021 10:28:44 -0500")
Message-ID: <87czwim56d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Use the location management facilities that the emulator uses, so that
> the current command line option appears in the error message.
>
> Before:
>
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: Invalid parameter 'key..'
>
> After:
>
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I have a similar patch in an unfinished branch.  You win :)

> ---
>  storage-daemon/qemu-storage-daemon.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 9aa82e7d96..78ddf619d4 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -152,6 +152,20 @@ static void init_qmp_commands(void)
>                           qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);
>  }
>  
> +static int getopt_set_loc(int argc, char **argv, const char *optstring,
> +                          const struct option *longopts)
> +{
> +    int c, save_index;
> +
> +    optarg = NULL;
> +    save_index = optind;
> +    c = getopt_long(argc, argv, optstring, longopts, NULL);
> +    if (optarg) {
> +        loc_set_cmdline(argv, save_index, MAX(1, optind - save_index));
> +    }
> +    return c;
> +}
> +

I think this function is more widely applicable:

    $ git-grep -l getopt_long | xargs grep -l error_report
    qemu-img.c
    qemu-io.c
    qemu-nbd.c
    scsi/qemu-pr-helper.c
    storage-daemon/qemu-storage-daemon.c

>  static void process_options(int argc, char *argv[])
>  {
>      int c;
> @@ -174,7 +188,7 @@ static void process_options(int argc, char *argv[])
>       * they are given on the command lines. This means that things must be
>       * defined first before they can be referenced in another option.
>       */
> -    while ((c = getopt_long(argc, argv, "-hT:V", long_options, NULL)) != -1) {
> +    while ((c = getopt_set_loc(argc, argv, "-hT:V", long_options)) != -1) {
>          switch (c) {
>          case '?':
>              exit(EXIT_FAILURE);
> @@ -275,12 +289,13 @@ static void process_options(int argc, char *argv[])
>                  break;
>              }
>          case 1:
> -            error_report("Unexpected argument: %s", optarg);
> +            error_report("Unexpected argument");
>              exit(EXIT_FAILURE);
>          default:
>              g_assert_not_reached();
>          }
>      }
> +    loc_set_none();
>  }
>  
>  int main(int argc, char *argv[])


