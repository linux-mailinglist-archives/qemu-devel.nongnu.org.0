Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E54400050
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:14:16 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM91L-0007SF-Of
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vw-000777-NJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vs-0001Mi-J9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PvkedtlNtKIeeCMkbEF6eY403WjuhEJ1RX3mvWDto8=;
 b=UW+LTMXG0p2AkvAZi8UkAqcYx7cehC5HjRLF+cxwjzPrymlnCWLyQpTiir4oka7RykhX5u
 4qSin5sgxRN9eoh/MGLpyhp1MylZGWlYuTbZCxQSH33REmr4Rk+lA4zJ/PYl/a1yR1BdlF
 9jDs1vvWKp8RuuC+0u0Wv7SDANrn+to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-KM0_3r3nNwqUz0DlgMxQqA-1; Fri, 03 Sep 2021 09:08:34 -0400
X-MC-Unique: KM0_3r3nNwqUz0DlgMxQqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1233B1966321;
 Fri,  3 Sep 2021 13:08:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADACE6788D;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA7F611380D5; Wed,  1 Sep 2021 16:29:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH v2 03/12] i386/sev: introduce 'sev-snp-guest' object
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-4-michael.roth@amd.com>
Date: Wed, 01 Sep 2021 16:29:03 +0200
In-Reply-To: <20210826222627.3556-4-michael.roth@amd.com> (Michael Roth's
 message of "Thu, 26 Aug 2021 17:26:18 -0500")
Message-ID: <87bl5cqsi8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P . =?utf-8?Q?Berran?= =?utf-8?Q?g=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael Roth <michael.roth@amd.com> writes:

> From: Brijesh Singh <brijesh.singh@amd.com>
>
> SEV-SNP support relies on a different set of properties/state than the
> existing 'sev-guest' object. This patch introduces the 'sev-snp-guest'
> object, which can be used to configure an SEV-SNP guest. For example,
> a default-configured SEV-SNP guest with no additional information
> passed in for use with attestation:
>
>   -object sev-snp-guest,id=sev0
>
> or a fully-specified SEV-SNP guest where all spec-defined binary
> blobs are passed in as base64-encoded strings:
>
>   -object sev-snp-guest,id=sev0, \
>     policy=0x30000, \
>     init-flags=0, \
>     id-block=YWFhYWFhYWFhYWFhYWFhCg==, \
>     id-auth=CxHK/OKLkXGn/KpAC7Wl1FSiisWDbGTEKz..., \
>     auth-key-enabled=on, \
>     host-data=LNkCWBRC5CcdGXirbNUV1OrsR28s..., \
>     guest-visible-workarounds=AA==, \
>
> See the QAPI schema updates included in this patch for more usage
> details.
>
> In some cases these blobs may be up to 4096 characters, but this is
> generally well below the default limit for linux hosts where
> command-line sizes are defined by the sysconf-configurable ARG_MAX
> value, which defaults to 2097152 characters for Ubuntu hosts, for
> example.
>
> Co-developed-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  docs/amd-memory-encryption.txt |  77 ++++++++++-
>  qapi/qom.json                  |  60 ++++++++
>  target/i386/sev.c              | 245 ++++++++++++++++++++++++++++++++-
>  3 files changed, 379 insertions(+), 3 deletions(-)
>
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index ffca382b5f..0d82e67fa1 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -22,8 +22,8 @@ support for notifying a guest's operating system when certain types of VMEXITs
>  are about to occur. This allows the guest to selectively share information with
>  the hypervisor to satisfy the requested function.
>  
> -Launching
> ----------
> +Launching (SEV and SEV-ES)
> +--------------------------
>  Boot images (such as bios) must be encrypted before a guest can be booted. The
>  MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
>  LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
> @@ -113,6 +113,79 @@ a SEV-ES guest:
>   - Requires in-kernel irqchip - the burden is placed on the hypervisor to
>     manage booting APs.
>  
> +Launching (SEV-SNP)
> +-------------------
> +Boot images (such as bios) must be encrypted before a guest can be booted. The
> +MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images:
> +KVM_SNP_INIT, SNP_LAUNCH_START, SNP_LAUNCH_UPDATE, and SNP_LAUNCH_FINISH. These
> +four commands together generate a fresh memory encryption key for the VM,
> +encrypt the boot images for a successful launch.
> +
> +KVM_SNP_INIT is called first to initialize the SEV-SNP firmware and SNP
> +features in the KVM. The feature flags value can be provided through the
> +'init-flags' property of the 'sev-snp-guest' object.
> +
> ++------------+-------+----------+---------------------------------+
> +| key        | type  | default  | meaning                         |
> ++------------+-------+----------+---------------------------------+
> +| init_flags | hex   | 0        | SNP feature flags               |
> ++-----------------------------------------------------------------+
> +
> +Note: currently the init_flags must be zero.
> +
> +SNP_LAUNCH_START is called first to create a cryptographic launch context
> +within the firmware. To create this context, guest owner must provide a guest
> +policy and other parameters as described in the SEV-SNP firmware
> +specification. The launch parameters should be specified as described in the
> +QAPI schema for the 'sev-snp-guest' object.
> +
> +The SNP_LAUNCH_START uses the following parameters (see the SEV-SNP
> +specification for more details):
> +
> ++--------+-------+----------+----------------------------------------------+
> +| key    | type  | default  | meaning                                      |
> ++--------+-------+----------+----------------------------------------------+
> +| policy | hex   | 0x30000  | a 64-bit guest policy                        |
> +| imi_en | bool  | 0        | 1 when IMI is enabled                        |
> +| ma_end | bool  | 0        | 1 when migration agent is used               |
> +| gosvw  | string| 0        | 16-byte base64 encoded string for the guest  |
> +|        |       |          | OS visible workaround.                       |
> ++--------+-------+----------+----------------------------------------------+
> +
> +SNP_LAUNCH_UPDATE encrypts the memory region using the cryptographic context
> +created via the SNP_LAUNCH_START command. If required, this command can be called
> +multiple times to encrypt different memory regions. The command also calculates
> +the measurement of the memory contents as it encrypts.
> +
> +SNP_LAUNCH_FINISH finalizes the guest launch flow. Optionally, while finalizing
> +the launch the firmware can perform checks on the launch digest computing
> +through the SNP_LAUNCH_UPDATE. To perform the check the user must supply
> +the id block, authentication blob and host data that should be included in the
> +attestation report. See the SEV-SNP spec for further details.
> +
> +The SNP_LAUNCH_FINISH uses the following parameters, which can be configured
> +by the corresponding parameters documented in the QAPI schema for the
> +'sev-snp-guest' object.
> +
> ++------------+-------+----------+----------------------------------------------+
> +| key        | type  | default  | meaning                                      |
> ++------------+-------+----------+----------------------------------------------+
> +| id_block   | string| none     | base64 encoded ID block                      |
> ++------------+-------+----------+----------------------------------------------+
> +| id_auth    | string| none     | base64 encoded authentication information    |
> ++------------+-------+----------+----------------------------------------------+
> +| auth_key_en| bool  | 0        | auth block contains author key               |
> ++------------+-------+----------+----------------------------------------------+
> +| host_data  | string| none     | host provided data                           |
> ++------------+-------+----------+----------------------------------------------+
> +
> +To launch a SEV-SNP guest (additional parameters are documented in the QAPI
> +schema for the 'sev-snp-guest' object):
> +
> +# ${QEMU} \
> +    -machine ...,confidential-guest-support=sev0 \
> +    -object sev-snp-guest,id=sev0,cbitpos=51,reduced-phys-bits=1
> +
>  Debugging
>  -----------
>  Since the memory contents of a SEV guest are encrypted, hypervisor access to
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 211e083727..ea39585026 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -775,6 +775,64 @@
>              '*policy': 'uint32',
>              '*handle': 'uint32' } }
>  
> +##
> +# @SevSnpGuestProperties:
> +#
> +# Properties for sev-snp-guest objects. Many of these are direct arguments
> +# for the SEV-SNP KVM interfaces documented in the linux kernel source
> +# documentation under 'amd-memory-encryption.rst'. Additional documentation
> +# is also available in the QEMU source tree under
> +# 'amd-memory-encryption.rst'.
> +#
> +# In addition to those files, please see the SEV-SNP Firmware Specification
> +# (Rev 0.9) documentation for the SNP_INIT and
> +# SNP_LAUNCH_{START,UPDATE,FINISH} firmware interfaces, which the KVM
> +# interfaces are written against.
> +#
> +# @init-flags: as documented for the 'flags' parameter of the
> +#              KVM_SNP_INIT KVM command (default: 0)
> +#
> +# @policy: as documented for the 'policy' parameter of the
> +#          KVM_SNP_LAUNCH_START KVM command (default: 0x30000)

These expose the host kernel's numerical encoding of over QMP.  I'm not
sure that's a good idea.

> +#
> +# @guest-visible-workarounds: 16-byte, base64-encoded blob to report
> +#                             hypervisor-defined workarounds, as documented
> +#                             for the 'gosvm' parameter of the
> +#                             KVM_SNP_LAUNCH_START KVM command.
> +#                             (default: all-zero)
> +#
> +# @id-block: 8-byte, base64-encoded blob to provide the ID Block
> +#            structure documented in SEV-SNP spec, as documented for the
> +#            'id_block_uaddr' parameter of the KVM_SNP_LAUNCH_FINISH
> +#            command (default: all-zero)
> +#
> +# @id-auth: 4096-byte, base64-encoded blob to provide the ID Authentication
> +#           Information Structure documented in SEV-SNP spec, as documented
> +#           for the 'id_auth_uaddr' parameter of the KVM_SNP_LAUNCH_FINISH
> +#           command (default: all-zero)
> +#
> +# @auth-key-enabled: true if 'id-auth' blob contains the Author Key
> +#                    documented in the SEV-SNP spec, as documented for the
> +#                    'auth_key_en' parameter of the KVM_SNP_LAUNCH_FINISH
> +#                    command (default: false)
> +#
> +# @host-data: 32-byte, base64-encoded user-defined blob to provide to the
> +#             guest, as documented for the 'host_data' parameter of the
> +#             KVM_SNP_LAUNCH_FINISH command (default: all-zero)
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'SevSnpGuestProperties',
> +  'base': 'SevCommonProperties',
> +  'data': {
> +            '*init-flags': 'uint64',
> +            '*policy': 'uint64',
> +            '*guest-visible-workarounds': 'str',
> +            '*id-block': 'str',
> +            '*id-auth': 'str',
> +            '*auth-key-enabled': 'bool',
> +            '*host-data': 'str' } }
> +
>  ##
>  # @ObjectType:
>  #
> @@ -816,6 +874,7 @@
>      'secret',
>      'secret_keyring',
>      'sev-guest',
> +    'sev-snp-guest',
>      's390-pv-guest',
>      'throttle-group',
>      'tls-creds-anon',
> @@ -873,6 +932,7 @@
>        'secret':                     'SecretProperties',
>        'secret_keyring':             'SecretKeyringProperties',
>        'sev-guest':                  'SevGuestProperties',
> +      'sev-snp-guest':              'SevSnpGuestProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',

Pretty much all Greek to me, but there are no obvious QAPI schema
no-nos, so

For the QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


