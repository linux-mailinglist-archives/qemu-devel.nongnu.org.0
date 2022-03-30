Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACFD4EC7DC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:09:06 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZwX-0000sr-KL
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:09:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nZZva-0007t7-SC
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nZZvS-0005hm-OM
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648652877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRL0hHsUYiCg0nfHMd2hqIXnl9KBgCUvsJDfx46b6dc=;
 b=c1fZqY5p/S9FLxsdwVxDSgm93IUPFR6W3AO2qTuk3WeDnKk7A8VRtu+Pl8yYSMJCLgGDb8
 JSs3mpdOXG0GbN6a3B6uvFtVivq9svGJHnQ00GmAVUTVxyFp4u5xM1IUmvXIoAIfVL5k8l
 VMfi77cTxPAQtqPPPZNaK/9/iTcg7hM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-oAYF3-5HMVulhJ3nZR-26A-1; Wed, 30 Mar 2022 11:07:54 -0400
X-MC-Unique: oAYF3-5HMVulhJ3nZR-26A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D906811E80;
 Wed, 30 Mar 2022 15:07:54 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D762026D64;
 Wed, 30 Mar 2022 15:07:53 +0000 (UTC)
Date: Wed, 30 Mar 2022 10:07:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 2/2] iotests/108: Test new refcount rebuild algorithm
Message-ID: <20220330150752.giunc3fr3kbmivex@redhat.com>
References: <20220329091917.24512-1-hreitz@redhat.com>
 <20220329091917.24512-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220329091917.24512-3-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-524-5b0234
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 11:19:17AM +0200, Hanna Reitz wrote:
> One clear problem with how qcow2's refcount structure rebuild algorithm
> used to be before "qcow2: Improve refcount structure rebuilding" was
> that it is prone to failure for qcow2 images on block devices: There is
> generally unused space after the actual image, and if that exceeds what
> one refblock covers, the old algorithm would invariably write the
> reftable past the block device's end, which cannot work.  The new
> algorithm does not have this problem.
> 
> Test it with three tests:
> (1) Create an image with more empty space at the end than what one
>     refblock covers, see whether rebuilding the refcount structures
>     results in a change in the image file length.  (It should not.)
> 
> (2) Leave precisely enough space somewhere at the beginning of the image
>     for the new reftable (and the refblock for that place), see whether
>     the new algorithm puts the reftable there.  (It should.)
> 
> (3) Test the original problem: Create (something like) a block device
>     with a fixed size, then create a qcow2 image in there, write some
>     data, and then have qemu-img check rebuild the refcount structures.
>     Before HEAD^, the reftable would have been written past the image
>     file end, i.e. outside of what the block device provides, which
>     cannot work.  HEAD^ should have fixed that.
>     ("Something like a block device" means a loop device if we can use
>     one ("sudo -n losetup" works), or a FUSE block export with
>     growable=false otherwise.)

NBD might work for that purpose as well.  But no need to rewrite your
test for yet another block-alike behavior ;)

> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/108     | 259 ++++++++++++++++++++++++++++++++++++-
>  tests/qemu-iotests/108.out |  81 ++++++++++++
>  2 files changed, 339 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> index 56339ab2c5..e9e2ced69b 100755
> --- a/tests/qemu-iotests/108
> +++ b/tests/qemu-iotests/108
> @@ -30,13 +30,20 @@ status=1	# failure is the default!
>  
>  _cleanup()
>  {
> -	_cleanup_test_img
> +    _cleanup_test_img

Nice TAB cleanup while at it.

> +    if [ -f "$TEST_DIR/qsd.pid" ]; then
> +        qsd_pid=$(cat "$TEST_DIR/qsd.pid")
> +        kill -KILL "$qsd_pid"

SIGKILL is harsh, skipping cleanup paths.  Do we want to try SIGINT
first, and only resort to SIGKILL if we didn't get a response?  Do we
(should we?) have a helper function for doing process reaping so that
we aren't open-coding a two-layer signal approach in all callers? [1]

> +        fusermount -u "$TEST_DIR/fuse-export" &>/dev/null
> +    fi
> +    rm -f "$TEST_DIR/fuse-export"
>  }
>  trap "_cleanup; exit \$status" 0 1 2 3 15
>  
>  # get standard environment, filters and checks
>  . ./common.rc
>  . ./common.filter
> +. ./common.qemu
>  
>  # This tests qcow2-specific low-level functionality
>  _supported_fmt qcow2
> @@ -47,6 +54,22 @@ _supported_os Linux
>  # files
>  _unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
>  
> +# This test either needs sudo -n losetup or FUSE exports to work
> +if sudo -n losetup &>/dev/null; then
> +    loopdev=true
> +else
> +    loopdev=false
> +
> +    # QSD --export fuse will either yield "Parameter 'id' is missing"
> +    # or "Invalid parameter 'fuse'", depending on whether there is
> +    # FUSE support or not.
> +    error=$($QSD --export fuse 2>&1)
> +    if [[ $error = *"Invalid parameter 'fuse'" ]]; then

Good thing iotests are written in bash.

> +        _notrun 'Passwordless sudo for losetup or FUSE support required, but' \
> +                'neither is available'
> +    fi
> +fi
> +
>  echo
>  echo '=== Repairing an image without any refcount table ==='
>  echo
> @@ -138,6 +161,240 @@ _make_test_img 64M
>  poke_file "$TEST_IMG" $((0x10008)) "\xff\xff\xff\xff\xff\xff\x00\x00"
>  _check_test_img -r all
>  
> +echo
> +echo '=== Check rebuilt reftable location ==='
> +
> +# In an earlier version of the refcount rebuild algorithm, the
> +# reftable was generally placed at the image end (unless something was
> +# allocated in the area covered by the refblock right before the image
> +# file end, then we would try to place the reftable in that refblock).
> +# This was later changed so the reftable would be placed in the
> +# earliest possible location.  Test this.
> +
> +echo
> +echo '--- Does the image size increase? ---'
> +echo
> +
> +# First test: Just create some image, write some data to it, and
> +# resize it so there is free space at the end of the image (enough
> +# that it spans at least one full refblock, which for cluster_size=512
> +# images, spans 128k).  With the old algorithm, the reftable would
> +# have then been placed at the end of the image file, but with the new
> +# one, it will be put in that free space.
> +# We want to check whether the size of the image file increases due to
> +# rebuilding the refcount structures (it should not).
> +
> +_make_test_img -o 'cluster_size=512' 1M
> +# Write something
> +$QEMU_IO -c 'write 0 64k' "$TEST_IMG" | _filter_qemu_io
> +
> +# Add free space
> +file_len=$(stat -c '%s' "$TEST_IMG")
> +truncate -s $((file_len + 256 * 1024)) "$TEST_IMG"
> +
> +# Corrupt the image by saying the image header were not allocated

s/were/was/

> +rt_offset=$(peek_file_be "$TEST_IMG" 48 8)
> +rb_offset=$(peek_file_be "$TEST_IMG" $rt_offset 8)
> +poke_file "$TEST_IMG" $rb_offset "\x00\x00"
> +
> +# Check whether rebuilding the refcount structures increases the image
> +# file size
> +file_len=$(stat -c '%s' "$TEST_IMG")
> +echo
> +# The only leaks there can be are the old refcount structures that are
> +# leaked during rebuilding, no need to clutter the output with them
> +_check_test_img -r all | grep -v '^Repairing cluster.*refcount=1 reference=0'
> +echo
> +post_repair_file_len=$(stat -c '%s' "$TEST_IMG")
> +
> +if [[ $file_len -eq $post_repair_file_len ]]; then
> +    echo 'OK: Image size did not change'
> +else
> +    echo 'ERROR: Image size differs' \
> +        "($file_len before, $post_repair_file_len after)"
> +fi
> +
> +echo
> +echo '--- Will the reftable occupy a hole specifically left for it?  ---'
> +echo
> +
> +# Note: With cluster_size=512, every refblock covers 128k.
> +# The reftable covers 8M per reftable cluster.
> +
> +# Create an image that requires two reftable clusters (just because
> +# this is more interesting than a single-clustered reftable).
> +_make_test_img -o 'cluster_size=512' 9M
> +$QEMU_IO -c 'write 0 8M' "$TEST_IMG" | _filter_qemu_io
> +
> +# Writing 8M will have resized the reftable.  Unfortunately, doing so
> +# will leave holes in the file, so we need to fill them up so we can
> +# be sure the whole file is allocated.  Do that by writing
> +# consecutively smaller chunks starting from 8 MB, until the file
> +# length increases even with a chunk size of 512.  Then we must have
> +# filled all holes.
> +ofs=$((8 * 1024 * 1024))
> +block_len=$((16 * 1024))
> +while [[ $block_len -ge 512 ]]; do
> +    file_len=$(stat -c '%s' "$TEST_IMG")
> +    while [[ $(stat -c '%s' "$TEST_IMG") -eq $file_len ]]; do
> +        # Do not include this in the reference output, it does not
> +        # really matter which qemu-io calls we do here exactly
> +        $QEMU_IO -c "write $ofs $block_len" "$TEST_IMG" >/dev/null
> +        ofs=$((ofs + block_len))
> +    done
> +    block_len=$((block_len / 2))
> +done

Interesting approach.

> +
> +# Fill up to 9M (do not include this in the reference output either,
> +# $ofs is random for all we know)
> +$QEMU_IO -c "write $ofs $((9 * 1024 * 1024 - ofs))" "$TEST_IMG" >/dev/null
> +
> +# Make space as follows:
> +# - For the first refblock: Right at the beginning of the image (this
> +#   refblock is placed in the first place possible),
> +# - For the reftable somewhere soon afterwards, still near the
> +#   beginning of the image (i.e. covered by the first refblock); the
> +#   reftable too is placed in the first place possible, but only after
> +#   all refblocks have been placed)
> +# No space is needed for the other refblocks, because no refblock is
> +# put before the space it covers.  In this test case, we do not mind
> +# if they are placed at the image file's end.
> +
> +# Before we make that space, we have to find out the host offset of
> +# the area that belonged to the two data clusters at guest offset 4k,
> +# because we expect the reftable to be placed there, and we will have
> +# to verify that it is.
> +
> +l1_offset=$(peek_file_be "$TEST_IMG" 40 8)
> +l2_offset=$(peek_file_be "$TEST_IMG" $l1_offset 8)
> +l2_offset=$((l2_offset & 0x00fffffffffffe00))
> +data_4k_offset=$(peek_file_be "$TEST_IMG" \
> +                 $((l2_offset + 4096 / 512 * 8)) 8)
> +data_4k_offset=$((data_4k_offset & 0x00fffffffffffe00))
> +
> +$QEMU_IO -c "discard 0 512" -c "discard 4k 1k" "$TEST_IMG" | _filter_qemu_io
> +
> +# Corrupt the image by saying the image header were not allocated

s/were/was/

> +rt_offset=$(peek_file_be "$TEST_IMG" 48 8)
> +rb_offset=$(peek_file_be "$TEST_IMG" $rt_offset 8)
> +poke_file "$TEST_IMG" $rb_offset "\x00\x00"
> +
> +echo
> +# The only leaks there can be are the old refcount structures that are
> +# leaked during rebuilding, no need to clutter the output with them
> +_check_test_img -r all | grep -v '^Repairing cluster.*refcount=1 reference=0'
> +echo
> +
> +# Check whether the reftable was put where we expected
> +rt_offset=$(peek_file_be "$TEST_IMG" 48 8)
> +if [[ $rt_offset -eq $data_4k_offset ]]; then
> +    echo 'OK: Reftable is where we expect it'
> +else
> +    echo "ERROR: Reftable is at $rt_offset, but was expected at $data_4k_offset"
> +fi
> +
> +echo
> +echo '--- Rebuilding refcount structures on block devices ---'
> +echo
> +
> +# A block device cannot really grow, at least not during qemu-img
> +# check.  As mentioned in the above cases, rebuilding the refcount
> +# structure may lead to new refcount structures being written after
> +# the end of the image, and in the past that happened even if there
> +# was more than sufficient space in the image.  Such post-EOF writes
> +# will not work on block devices, so test that the new algorithm
> +# avoids it.
> +
> +# If we have passwordless sudo and losetup, we can use those to create
> +# a block device.  Otherwise, we can resort to qemu's FUSE export to
> +# create a file that isn't growable, which effectively tests the same
> +# thing.
> +
> +_cleanup_test_img
> +truncate -s $((64 * 1024 * 1024)) "$TEST_IMG"
> +
> +if $loopdev; then
> +    export_mp=$(sudo -n losetup --show -f "$TEST_IMG")
> +    export_mp_driver=host_device
> +    sudo -n chmod go+rw "$export_mp"
> +else
> +    # Create non-growable FUSE export that is a bit like an empty
> +    # block device
> +    export_mp="$TEST_DIR/fuse-export"
> +    export_mp_driver=file
> +    touch "$export_mp"
> +
> +    $QSD \
> +        --blockdev file,node-name=export-node,filename="$TEST_IMG" \
> +        --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=off \
> +        --pidfile "$TEST_DIR/qsd.pid" \
> +        --daemonize
> +fi
> +
> +# Now create a qcow2 image on the device -- unfortunately, qemu-img
> +# create force-creates the file, so we have to resort to the
> +# blockdev-create job.

Huh. Why do we have 'qemu-img convert -n' but not 'qemu-img create -n'
for writing a particular destination format into an already existing
storage space?

> +_launch_qemu \
> +    --blockdev $export_mp_driver,node-name=file,filename="$export_mp"
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{ "execute": "qmp_capabilities" }' \
> +    'return'
> +
> +# Small cluster size again, so the image needs multiple refblocks
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{ "execute": "blockdev-create",
> +       "arguments": {
> +           "job-id": "create",
> +           "options": {
> +               "driver": "qcow2",
> +               "file": "file",
> +               "size": '$((64 * 1024 * 1024))',

Oh, the joys of nested quoting ;)

> +               "cluster-size": 512
> +           } } }' \
> +    '"concluded"'
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{ "execute": "job-dismiss", "arguments": { "id": "create" } }' \
> +    'return'
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{ "execute": "quit" }' \
> +    'return'
> +
> +wait=y _cleanup_qemu
> +echo
> +
> +# Write some data
> +$QEMU_IO -c 'write 0 64k' "$export_mp" | _filter_qemu_io
> +
> +# Corrupt the image by saying the image header were not allocated

s/were/was/

> +rt_offset=$(peek_file_be "$export_mp" 48 8)
> +rb_offset=$(peek_file_be "$export_mp" $rt_offset 8)
> +poke_file "$export_mp" $rb_offset "\x00\x00"
> +
> +# Repairing such a simple case should just work
> +# (We used to put the reftable at the end of the image file, which can
> +# never work for non-growable devices.)
> +echo
> +TEST_IMG="$export_mp" _check_test_img -r all \
> +    | grep -v '^Repairing cluster.*refcount=1 reference=0'
> +
> +if $loopdev; then
> +    sudo -n losetup -d "$export_mp"
> +else
> +    qsd_pid=$(cat "$TEST_DIR/qsd.pid")
> +    kill -TERM "$qsd_pid"
> +    # Wait for process to exit (cannot `wait` because the QSD is daemonized)
> +    while [ -f "$TEST_DIR/qsd.pid" ]; do
> +        true
> +    done
> +fi

[1] Okay, when the test normally passes, you ARE doing a safe cleanup,
and saving SIGKILL only for the really bad cases where the test fails,
and we don't care if even more gets stranded.

> +
>  # success, all done
>  echo '*** done'
>  rm -f $seq.full

Nice addition to the testsuite.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


