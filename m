Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F58D3B88CA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:54:09 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfLc-0005Ad-Ev
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyf6U-00062l-R0
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyf6L-00054l-7b
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625078299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cFQUwsVApAd+11cPLNBjd1qXjs2NzMouPjxV/laCrc=;
 b=Td5u9Fg1H80CMGGXeweLlmMtoh4THctHFo36Qc5lFtHxxx7WN94PjgAN7g7lRx3/g14xCa
 rqlIKa9uu+Q8KQD9VbTpAmkd0sy/4QEA6lDu6jPnqyZmvqvkhDN3587yasUlx5+yG1rPSi
 TF4DZjIphi43mm1ay9+giS1k+CzluXE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-tTEButXiN_iaUu1wV7aZ4w-1; Wed, 30 Jun 2021 14:38:17 -0400
X-MC-Unique: tTEButXiN_iaUu1wV7aZ4w-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso1295640wrh.12
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2cFQUwsVApAd+11cPLNBjd1qXjs2NzMouPjxV/laCrc=;
 b=SDN5zizQ49ffd7Qr1Iuzkdf+dux8WMhprU+9CNz9N9wpbqBItRD73Aq5iVKrAKKiaB
 EvYib7/Q3D/rtShFThI3vqJQT+I4KZPq/iS3P8oAnSfKIzHohOoHDbbf8tVCSwJsP5YY
 lut4pX/WD5ImWqJ/Upi4kXuimk9l3FzXS6B43Y1IfHCT7zk+xzkJDq4vPcmbYDOYW8xA
 WB8aLEfeW7DqJCjlrJT8O2iBZ30bTIQjjxmtjiqfMpJuGZP3i8hxLUUBNpLikcYIBiKf
 PpRQUGYb+vmb2B1KE/L0UxbiKTMCJ9dV7jkBb+8Dx7JRn+HvJ3Mm2dO3ful2vRN3Z88Z
 PQng==
X-Gm-Message-State: AOAM531Hhu5F5UmnMBVwJBldpt3neUBQjNMhSgRWaOrE/ziY9pVMl3L4
 HExQW8RB39BLUdBxpSXwzDpvOEC8Uywh1P4slLAzLTtMN3dz7d4lzmNO+hJlJ1WeZFhAr75TktQ
 dwf16BGIM4yLSCZU=
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr550770wma.29.1625078296795; 
 Wed, 30 Jun 2021 11:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCZW2/D2Ow7Vot82NSTC66tQiqRswfdmr4Cu/WWgY2vBXjsKvPfp0DcGJP2Ra1lKeNABwUcA==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr550751wma.29.1625078296531; 
 Wed, 30 Jun 2021 11:38:16 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id w8sm22365162wre.70.2021.06.30.11.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:38:15 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:38:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] docs: describe the security considerations with
 virtiofsd xattr mapping
Message-ID: <YNy6FuN4GWRtlXFf@work-vm>
References: <20210611120427.49736-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210611120427.49736-1-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Different guest xattr prefixes have distinct access control rules applied
> by the guest. When remapping a guest xattr care must be taken that the
> remapping does not allow the a guest user to bypass guest kernel access
> control rules.
> 
> For example if 'trusted.*' which requires CAP_SYS_ADMIN is remapped
> to 'user.virtiofs.trusted.*', an unprivileged guest user which can
> write to 'user.*' can bypass the CAP_SYS_ADMIN control. Thus the
> target of any remapping must be explicitly blocked from read/writes
> by the guest, to prevent access control bypass.
> 
> The examples shown in the virtiofsd man page already do the right
> thing and ensure safety, but the security implications of getting
> this wrong were not made explicit. This could lead to host admins
> and apps unwittingly creating insecure configurations.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Queued

> ---
>  docs/tools/virtiofsd.rst | 55 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 00554c75bd..6370ab927c 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -127,8 +127,8 @@ Options
>    timeout.  ``always`` sets a long cache lifetime at the expense of coherency.
>    The default is ``auto``.
>  
> -xattr-mapping
> --------------
> +Extended attribute (xattr) mapping
> +----------------------------------
>  
>  By default the name of xattr's used by the client are passed through to the server
>  file system.  This can be a problem where either those xattr names are used
> @@ -136,6 +136,9 @@ by something on the server (e.g. selinux client/server confusion) or if the
>  virtiofsd is running in a container with restricted privileges where it cannot
>  access some attributes.
>  
> +Mapping syntax
> +~~~~~~~~~~~~~~
> +
>  A mapping of xattr names can be made using -o xattrmap=mapping where the ``mapping``
>  string consists of a series of rules.
>  
> @@ -232,8 +235,48 @@ Note: When the 'security.capability' xattr is remapped, the daemon has to do
>  extra work to remove it during many operations, which the host kernel normally
>  does itself.
>  
> -xattr-mapping Examples
> -----------------------
> +Security considerations
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Operating systems typically partition the xattr namespace using
> +well defined name prefixes. Each partition may have different
> +access controls applied. For example, on Linux there are multiple
> +partitions
> +
> + * ``system.*`` - access varies depending on attribute & filesystem
> + * ``security.*`` - only processes with CAP_SYS_ADMIN
> + * ``trusted.*`` - only processes with CAP_SYS_ADMIN
> + * ``user.*`` - any process granted by file permissions / ownership
> +
> +While other OS such as FreeBSD have different name prefixes
> +and access control rules.
> +
> +When remapping attributes on the host, it is important to
> +ensure that the remapping does not allow a guest user to
> +evade the guest access control rules.
> +
> +Consider if ``trusted.*`` from the guest was remapped to
> +``user.virtiofs.trusted*`` in the host. An unprivileged
> +user in a Linux guest has the ability to write to xattrs
> +under ``user.*``. Thus the user can evade the access
> +control restriction on ``trusted.*`` by instead writing
> +to ``user.virtiofs.trusted.*``.
> +
> +As noted above, the partitions used and access controls
> +applied, will vary across guest OS, so it is not wise to
> +try to predict what the guest OS will use.
> +
> +The simplest way to avoid an insecure configuration is
> +to remap all xattrs at once, to a given fixed prefix.
> +This is shown in example (1) below.
> +
> +If selectively mapping only a subset of xattr prefixes,
> +then rules must be added to explicitly block direct
> +access to the target of the remapping. This is shown
> +in example (2) below.
> +
> +Mapping examples
> +~~~~~~~~~~~~~~~~
>  
>  1) Prefix all attributes with 'user.virtiofs.'
>  
> @@ -270,7 +313,9 @@ stripping of 'user.virtiofs.'.
>  The second rule hides unprefixed 'trusted.' attributes
>  on the host.
>  The third rule stops a guest from explicitly setting
> -the 'user.virtiofs.' path directly.
> +the 'user.virtiofs.' path directly to prevent access
> +control bypass on the target of the earlier prefix
> +remapping.
>  Finally, the fourth rule lets all remaining attributes
>  through.
>  
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


